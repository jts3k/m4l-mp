# MediaPipe Tracker for Max/MSP and Max For Live

A Max for Live and Max patch that runs MediaPipe tracking (hand, face, or pose) and outputs tracking data via OSC.

## Features

- **Hand tracking** with left/right hand identification
- **Face tracking** with mesh visualization
- **Pose tracking** with optional body centering/normalization
- Multiple body/hand/face detection (up to 6)
- Camera selection from available devices
- Real-time OSC output
- Visual preview window with tracking overlay

## Requirements

- Max/MSP 8+ or Ableton Live with Max For Live
- Python 3.9 or later
- Webcam or virtual camera

## Installation

### Step 1: Install Python

#### macOS

Python 3 may already be installed. Check by opening Terminal and running:

```bash
python3 --version
```

If not installed, install via [Homebrew](https://brew.sh):

```bash
brew install python
```

Or download from [python.org](https://www.python.org/downloads/).

#### Windows

Download and install Python from [python.org](https://www.python.org/downloads/).

**Important:** During installation, check the box that says **"Add Python to PATH"**.

### Step 2: Download or Clone This Repository

```bash
git clone https://github.com/YOUR_USERNAME/m4l-mp.git
cd m4l-mp
```

Or download and extract the ZIP file.

### Step 3: Create a Virtual Environment and Install Dependencies

#### macOS (Terminal)

```bash
cd /path/to/m4l-mp
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

#### Windows (Command Prompt or PowerShell)

```cmd
cd \path\to\m4l-mp
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```

### Step 4: Open in Max or Ableton Live

**For Max/MSP:**
- Open `m4l-mp.maxpat`

**For Max For Live (Ableton Live):**
- Drag `m4l-mp.amxd` onto a MIDI or Audio track

## Usage

1. Select tracking type (hand, face, or pose)
2. Select your camera from the dropdown (cameras are auto-detected on load)
3. Set the number of hands/faces/bodies to track
4. Configure OSC host and port (default: 127.0.0.1:9000)
5. Click the **Run** toggle to start tracking

A preview window will open showing the camera feed with tracking overlay.

## OSC Output

Messages are sent to the configured host/port:

| Address | Arguments | Description |
|---------|-----------|-------------|
| `/mediapipe/hand/0` | x1 y1 z1 x2 y2 z2 ... | 21 hand landmarks (63 floats) |
| `/mediapipe/hand/1` | x1 y1 z1 x2 y2 z2 ... | Second hand landmarks |
| `/mediapipe/face/0` | x1 y1 z1 x2 y2 z2 ... | 478 face landmarks (1434 floats) |
| `/mediapipe/pose/0` | x1 y1 z1 x2 y2 z2 ... | 33 pose landmarks (99 floats) |
| `/mediapipe/count` | int | Number of detected bodies/hands/faces |
| `/mediapipe/confidence` | float | Detection confidence (0-1) |
| `/mediapipe/centered/0` | x1 y1 z1 ... | Centered pose coordinates (pose only) |
| `/mediapipe/bbox/0` | min_x min_y max_x max_y | Bounding box (pose only) |

Landmark coordinates are normalized 0-1 (x, y) with z representing depth.

## Troubleshooting

### Camera not detected
- Click the **Scan** button to refresh the camera list
- Make sure no other application is using the camera

### Python errors in Max console
- Ensure you created the virtual environment in the correct folder
- Make sure all dependencies are installed: `pip install -r requirements.txt`

### Tracking not starting
- Check that the camera index is valid
- Try a different camera if available

### Preview window not closing
- Click the Run toggle off, or press Q/Esc in the preview window

## License

MIT License

## Credits

Built with:
- [MediaPipe](https://mediapipe.dev/) by Google
- [OpenCV](https://opencv.org/)
- [Max/MSP](https://cycling74.com/) by Cycling '74
