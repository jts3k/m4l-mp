/**
 * MediaPipe Tracker - Node for Max Script
 * Bridges Max For Live with Python MediaPipe tracker
 */

const maxApi = require('max-api');
const { spawn } = require('child_process');
const path = require('path');
const fs = require('fs');
const readline = require('readline');

let pythonProcess = null;
let currentType = 'hand';
let currentCamera = 0;
let currentNumBodies = 1;
let currentCenter = false;
let isRunning = false;
let cameraIndices = []; // Maps umenu index to actual camera index

// Get the directory where this script is located
const scriptDir = path.dirname(module.filename);
const trackerScript = path.join(scriptDir, 'tracker.py');

/**
 * Find Python executable - prefers venv if it exists
 */
function getPythonPath() {
    const venvPaths = [
        path.join(scriptDir, 'venv', 'bin', 'python3'),
        path.join(scriptDir, 'venv', 'bin', 'python'),
        path.join(scriptDir, 'venv', 'Scripts', 'python.exe'),
        path.join(scriptDir, '.venv', 'bin', 'python3'),
        path.join(scriptDir, '.venv', 'bin', 'python')
    ];

    for (const venvPath of venvPaths) {
        if (fs.existsSync(venvPath)) {
            maxApi.post('Using venv Python: ' + venvPath);
            return venvPath;
        }
    }

    maxApi.post('No venv found, using system Python');
    return 'python3';
}

/**
 * List available cameras
 */
async function listCameras() {
    const pythonPath = getPythonPath();
    maxApi.post('Scanning for cameras...');

    return new Promise((resolve) => {
        const proc = spawn(pythonPath, [trackerScript, '--list-cameras'], {
            cwd: scriptDir
        });

        let output = '';
        proc.stdout.on('data', (data) => {
            output += data.toString();
        });

        proc.on('close', () => {
            try {
                const result = JSON.parse(output.trim());
                if (result.cameras && result.indices) {
                    // Store the mapping from umenu index to camera index
                    cameraIndices = result.indices;

                    // Send clear and then each camera name for umenu population
                    maxApi.outlet('cameras', 'clear');
                    for (const name of result.cameras) {
                        maxApi.outlet('cameras', 'append', name);
                    }
                    maxApi.post('Found cameras: ' + result.cameras.join(', '));
                }
            } catch (e) {
                maxApi.post('Error listing cameras: ' + e.message);
            }
            resolve();
        });
    });
}

/**
 * Set camera by umenu index (maps to actual camera index)
 */
function setCameraByMenuIndex(menuIndex) {
    const camIndex = cameraIndices[menuIndex];
    if (camIndex !== undefined) {
        currentCamera = camIndex;
        maxApi.post('Camera set to index ' + camIndex);

        if (isRunning) {
            startTracker();
        }
    } else {
        maxApi.post('Invalid camera menu index: ' + menuIndex);
    }
}

/**
 * Start the Python tracker process
 */
function startTracker() {
    if (isRunning) {
        maxApi.post('Tracker already running, stopping first...');
        stopTracker();
        // Small delay to ensure process is stopped
        setTimeout(() => startTrackerInternal(), 100);
    } else {
        startTrackerInternal();
    }
}

function startTrackerInternal() {
    maxApi.post(`Starting ${currentType} tracker (camera: ${currentCamera}, bodies: ${currentNumBodies}, center: ${currentCenter})...`);

    const pythonPath = getPythonPath();

    const args = [
        trackerScript,
        '--type', currentType,
        '--camera', String(currentCamera),
        '--num-bodies', String(currentNumBodies)
    ];

    if (currentCenter) {
        args.push('--center');
    }

    pythonProcess = spawn(pythonPath, args, {
        cwd: scriptDir,
        stdio: ['pipe', 'pipe', 'pipe']
    });

    isRunning = true;
    maxApi.outlet('status', 'starting');

    const rl = readline.createInterface({
        input: pythonProcess.stdout,
        crlfDelay: Infinity
    });

    rl.on('line', (line) => {
        try {
            const data = JSON.parse(line);
            handleTrackerData(data);
        } catch (e) {
            maxApi.post('JSON parse error: ' + e.message + ' Line: ' + line.substring(0, 100));
        }
    });

    pythonProcess.stderr.on('data', (data) => {
        // Filter out common non-error messages
        const msg = data.toString();
        if (!msg.includes('INFO:') && !msg.includes('I0000')) {
            maxApi.post('Python: ' + msg.trim());
        }
    });

    pythonProcess.on('close', (code) => {
        maxApi.post(`Tracker process exited with code ${code}`);
        isRunning = false;
        pythonProcess = null;
        maxApi.outlet('status', 'stopped');
    });

    pythonProcess.on('error', (err) => {
        maxApi.post('Failed to start tracker: ' + err.message);
        isRunning = false;
        pythonProcess = null;
        maxApi.outlet('status', 'error');
    });
}

/**
 * Handle data from Python tracker
 */
function handleTrackerData(data) {
    // Handle status messages
    if (data.status) {
        maxApi.post('Status: ' + data.status);
        maxApi.outlet('status', data.status);

        if (data.status === 'ready') {
            maxApi.post(`Tracker ready: ${data.type}, camera: ${data.camera}, bodies: ${data.num_bodies}`);
        }
        return;
    }

    // Handle errors
    if (data.error) {
        maxApi.post('Tracker error: ' + data.error);
        maxApi.outlet('status', 'error');
        maxApi.outlet('error', data.error);
        return;
    }

    // Handle camera list
    if (data.cameras) {
        maxApi.outlet('cameras', ...data.cameras);
        return;
    }

    // Output tracking data
    const trackingType = data.type || 'unknown';

    // Always output count and confidence
    maxApi.outlet('count', data.count || 0);
    maxApi.outlet('confidence', data.confidence || 0);

    // Output body data
    if (data.bodies && data.bodies.length > 0) {
        // Output each body's landmarks
        for (let i = 0; i < data.bodies.length; i++) {
            const bodyData = data.bodies[i];
            // Format: landmarks <type> <body_index> <coords...>
            maxApi.outlet('landmarks', trackingType, i, ...bodyData);
        }

        // Output handedness for hand tracking (Left/Right)
        if (data.handedness && data.handedness.length > 0) {
            for (let i = 0; i < data.handedness.length; i++) {
                // Format: handedness <index> <Left|Right>
                maxApi.outlet('handedness', i, data.handedness[i]);
            }
        }

        // For pose tracking, also output centered coordinates if available
        if (data.centered && data.centered.length > 0) {
            for (let i = 0; i < data.centered.length; i++) {
                const centeredData = data.centered[i];
                maxApi.outlet('centered', i, ...centeredData);
            }
        }

        // Output bounding boxes for pose
        if (data.bboxes && data.bboxes.length > 0) {
            for (let i = 0; i < data.bboxes.length; i++) {
                const bbox = data.bboxes[i];
                maxApi.outlet('bbox', i, bbox.min_x, bbox.min_y, bbox.max_x, bbox.max_y);
            }
        }
    }
}

/**
 * Stop the Python tracker process
 */
function stopTracker() {
    if (pythonProcess) {
        maxApi.post('Stopping tracker...');
        const proc = pythonProcess;
        pythonProcess = null;
        isRunning = false;

        // Close stdin to signal Python to exit gracefully
        if (proc.stdin) {
            proc.stdin.end();
        }

        // Send SIGTERM
        try {
            proc.kill('SIGTERM');
        } catch (e) {
            // Process may already be dead
        }

        // Force kill after timeout if still running
        setTimeout(() => {
            try {
                // Check if process is still running by sending signal 0
                process.kill(proc.pid, 0);
                // If we get here, process is still alive - force kill
                maxApi.post('Force killing tracker...');
                proc.kill('SIGKILL');
            } catch (e) {
                // Process already exited, which is good
            }
        }, 500);

        maxApi.outlet('status', 'stopped');
    }
}

/**
 * Set tracking type
 */
function setType(type) {
    const validTypes = ['hand', 'face', 'pose'];
    if (validTypes.includes(type)) {
        currentType = type;
        maxApi.post('Tracking type set to: ' + type);

        if (isRunning) {
            startTracker();
        }
    } else {
        maxApi.post('Invalid type. Use: hand, face, or pose');
    }
}

/**
 * Set camera index
 */
function setCamera(index) {
    const camIndex = parseInt(index, 10);
    if (!isNaN(camIndex) && camIndex >= 0) {
        currentCamera = camIndex;
        maxApi.post('Camera set to: ' + camIndex);

        if (isRunning) {
            startTracker();
        }
    } else {
        maxApi.post('Invalid camera index');
    }
}

/**
 * Set number of bodies to detect
 */
function setNumBodies(num) {
    const n = parseInt(num, 10);
    if (!isNaN(n) && n >= 1 && n <= 6) {
        currentNumBodies = n;
        maxApi.post('Number of bodies set to: ' + n);

        if (isRunning) {
            startTracker();
        }
    } else {
        maxApi.post('Invalid number of bodies (1-6)');
    }
}

/**
 * Set center mode for pose tracking
 */
function setCenter(enabled) {
    currentCenter = enabled === 1 || enabled === true || enabled === 'true';
    maxApi.post('Center mode: ' + (currentCenter ? 'enabled' : 'disabled'));

    if (isRunning && currentType === 'pose') {
        startTracker();
    }
}

// Register Max message handlers
maxApi.addHandler('start', startTracker);
maxApi.addHandler('stop', stopTracker);
maxApi.addHandler('type', setType);
maxApi.addHandler('camera', setCamera);
maxApi.addHandler('cameraMenu', setCameraByMenuIndex);
maxApi.addHandler('numBodies', setNumBodies);
maxApi.addHandler('num_bodies', setNumBodies);
maxApi.addHandler('center', setCenter);
maxApi.addHandler('listCameras', listCameras);
maxApi.addHandler('list_cameras', listCameras);

maxApi.addHandler('bang', () => {
    maxApi.post('MediaPipe Tracker ready');
    maxApi.outlet('status', 'loaded');
});

// Cleanup on exit
process.on('exit', () => {
    stopTracker();
});

process.on('SIGTERM', () => {
    stopTracker();
    process.exit(0);
});

// Initialize: list cameras automatically at startup
async function initialize() {
    maxApi.post('MediaPipe Tracker Node script loaded');
    maxApi.outlet('status', 'loaded');

    // Auto-scan cameras at startup
    maxApi.post('Auto-scanning cameras...');
    await listCameras();
}

initialize();
