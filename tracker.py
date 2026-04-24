#!/usr/bin/env python3
"""
MediaPipe Tracker for Max For Live
Captures webcam video, runs MediaPipe tracking, outputs JSON to stdout.
Uses the MediaPipe Tasks API.
"""

import argparse
import json
import sys
import signal
import os
import urllib.request
import threading
import cv2
import numpy as np

# MediaPipe Tasks imports
import mediapipe as mp
from mediapipe.tasks import python
from mediapipe.tasks.python import vision

# Global flag for graceful shutdown
running = True

def signal_handler(sig, frame):
    global running
    running = False
    # Force exit after a short delay if main loop doesn't exit
    threading.Timer(1.0, lambda: os._exit(0)).start()

signal.signal(signal.SIGINT, signal_handler)
signal.signal(signal.SIGTERM, signal_handler)


def stdin_monitor():
    """Monitor stdin for closure - exit when parent process closes our stdin."""
    global running
    try:
        while running:
            # Try to read from stdin - will return empty on EOF/closure
            line = sys.stdin.readline()
            if not line:  # EOF - stdin was closed
                running = False
                break
    except:
        running = False

# Model URLs from Google's MediaPipe model repository
MODEL_URLS = {
    'hand': 'https://storage.googleapis.com/mediapipe-models/hand_landmarker/hand_landmarker/float16/latest/hand_landmarker.task',
    'face': 'https://storage.googleapis.com/mediapipe-models/face_landmarker/face_landmarker/float16/latest/face_landmarker.task',
    'pose': 'https://storage.googleapis.com/mediapipe-models/pose_landmarker/pose_landmarker_heavy/float16/latest/pose_landmarker_heavy.task'
}

# Hand connections for drawing
HAND_CONNECTIONS = [
    (0, 1), (1, 2), (2, 3), (3, 4),
    (0, 5), (5, 6), (6, 7), (7, 8),
    (0, 9), (9, 10), (10, 11), (11, 12),
    (0, 13), (13, 14), (14, 15), (15, 16),
    (0, 17), (17, 18), (18, 19), (19, 20),
    (5, 9), (9, 13), (13, 17)
]

# Pose connections for drawing
POSE_CONNECTIONS = [
    (0, 1), (1, 2), (2, 3), (3, 7),
    (0, 4), (4, 5), (5, 6), (6, 8),
    (9, 10),
    (11, 12),
    (11, 13), (13, 15),
    (12, 14), (14, 16),
    (11, 23), (12, 24),
    (23, 24),
    (23, 25), (25, 27), (27, 29), (29, 31),
    (24, 26), (26, 28), (28, 30), (30, 32)
]

# Face mesh connections - key contours and features
# These define the mesh topology for face landmark visualization
FACE_CONNECTIONS = [
    # Face oval
    (10, 338), (338, 297), (297, 332), (332, 284), (284, 251), (251, 389),
    (389, 356), (356, 454), (454, 323), (323, 361), (361, 288), (288, 397),
    (397, 365), (365, 379), (379, 378), (378, 400), (400, 377), (377, 152),
    (152, 148), (148, 176), (176, 149), (149, 150), (150, 136), (136, 172),
    (172, 58), (58, 132), (132, 93), (93, 234), (234, 127), (127, 162),
    (162, 21), (21, 54), (54, 103), (103, 67), (67, 109), (109, 10),
    # Left eyebrow
    (66, 107), (107, 55), (55, 65), (65, 52), (52, 53), (53, 46),
    # Right eyebrow
    (296, 336), (336, 285), (285, 295), (295, 282), (282, 283), (283, 276),
    # Left eye
    (33, 7), (7, 163), (163, 144), (144, 145), (145, 153), (153, 154),
    (154, 155), (155, 133), (133, 173), (173, 157), (157, 158), (158, 159),
    (159, 160), (160, 161), (161, 246), (246, 33),
    # Right eye
    (362, 382), (382, 381), (381, 380), (380, 374), (374, 373), (373, 390),
    (390, 249), (249, 263), (263, 466), (466, 388), (388, 387), (387, 386),
    (386, 385), (385, 384), (384, 398), (398, 362),
    # Nose
    (168, 6), (6, 197), (197, 195), (195, 5), (5, 4), (4, 1), (1, 19),
    (19, 94), (94, 2), (2, 164),
    # Outer lips
    (61, 146), (146, 91), (91, 181), (181, 84), (84, 17), (17, 314),
    (314, 405), (405, 321), (321, 375), (375, 291), (291, 409), (409, 270),
    (270, 269), (269, 267), (267, 0), (0, 37), (37, 39), (39, 40), (40, 185),
    (185, 61),
    # Inner lips
    (78, 95), (95, 88), (88, 178), (178, 87), (87, 14), (14, 317),
    (317, 402), (402, 318), (318, 324), (324, 308), (308, 415), (415, 310),
    (310, 311), (311, 312), (312, 13), (13, 82), (82, 81), (81, 80),
    (80, 191), (191, 78),
]

# Colors for multiple bodies (BGR format)
BODY_COLORS = [
    (0, 255, 0),    # Green
    (255, 0, 0),    # Blue
    (0, 0, 255),    # Red
    (255, 255, 0),  # Cyan
    (255, 0, 255),  # Magenta
    (0, 255, 255),  # Yellow
]


def list_cameras_avfoundation():
    """List cameras using AVFoundation via PyObjC (no camera opening, accurate indices)."""
    try:
        import AVFoundation

        devices = AVFoundation.AVCaptureDevice.devicesWithMediaType_(AVFoundation.AVMediaTypeVideo)
        cameras = []
        for i, device in enumerate(devices):
            name = device.localizedName()
            cameras.append({"index": i, "name": name})

        if cameras:
            return cameras
    except ImportError:
        pass
    except Exception:
        pass
    return None


def list_cameras_ffmpeg():
    """List cameras using ffmpeg AVFoundation (no camera opening, with names and indices)."""
    import subprocess
    import re
    try:
        result = subprocess.run(
            ['ffmpeg', '-f', 'avfoundation', '-list_devices', 'true', '-i', ''],
            capture_output=True, text=True, timeout=5
        )
        # ffmpeg outputs device list to stderr
        output = result.stderr

        cameras = []
        # Parse lines like: [AVFoundation indev @ 0x...] [0] FaceTime HD Camera
        # Video devices come before audio devices
        in_video_section = False
        for line in output.split('\n'):
            if 'AVFoundation video devices:' in line:
                in_video_section = True
                continue
            if 'AVFoundation audio devices:' in line:
                break
            if in_video_section:
                # Match [index] followed by device name
                match = re.search(r'\[(\d+)\]\s*(.+?)(?:\s*$)', line)
                if match:
                    idx = int(match.group(1))
                    name = match.group(2).strip()
                    if name:
                        cameras.append({"index": idx, "name": name})

        if cameras:
            return cameras
    except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
        pass
    return None


def list_cameras_system_profiler():
    """Get camera names on macOS using system_profiler (no camera opening)."""
    import subprocess
    try:
        result = subprocess.run(
            ['system_profiler', 'SPCameraDataType', '-json'],
            capture_output=True, text=True, timeout=5
        )
        if result.returncode == 0:
            import json as json_module
            data = json_module.loads(result.stdout)
            cameras = data.get('SPCameraDataType', [])
            # Return cameras with indices matching their position
            # system_profiler order typically matches AVFoundation indices
            return [{"index": i, "name": cam.get('_name', f'Camera {i}')}
                    for i, cam in enumerate(cameras)]
    except Exception:
        pass
    return None


def list_cameras(max_cameras=10):
    """List available cameras without opening them."""
    import platform

    if platform.system() == 'Darwin':
        # Try AVFoundation via PyObjC first - most accurate
        cameras = list_cameras_avfoundation()
        if cameras:
            return cameras

        # Try ffmpeg - also accurate
        cameras = list_cameras_ffmpeg()
        if cameras:
            return cameras

        # Fallback to system_profiler - order may not match AVFoundation indices
        cameras = list_cameras_system_profiler()
        if cameras:
            return cameras

    # Final fallback: return generic list
    return [{"index": i, "name": f"Camera {i}"} for i in range(3)]


def get_model_path(model_type):
    """Get path to model file, downloading if necessary."""
    script_dir = os.path.dirname(os.path.abspath(__file__))
    models_dir = os.path.join(script_dir, 'models')
    os.makedirs(models_dir, exist_ok=True)

    model_filename = f'{model_type}_landmarker.task'
    model_path = os.path.join(models_dir, model_filename)

    if not os.path.exists(model_path):
        output_json({"status": "downloading", "model": model_type})
        url = MODEL_URLS[model_type]
        urllib.request.urlretrieve(url, model_path)
        output_json({"status": "downloaded", "model": model_type})

    return model_path


def draw_landmarks(frame, landmarks, connections, color=(0, 255, 0), thickness=2):
    """Draw landmarks and connections on frame."""
    h, w = frame.shape[:2]
    points = [(int(lm.x * w), int(lm.y * h)) for lm in landmarks]

    for start_idx, end_idx in connections:
        if start_idx < len(points) and end_idx < len(points):
            cv2.line(frame, points[start_idx], points[end_idx], color, thickness)

    for point in points:
        cv2.circle(frame, point, 4, color, -1)


def get_pose_bounding_box(landmarks):
    """Get bounding box for a pose (using torso landmarks for stability)."""
    # Use shoulders and hips for bounding box (indices 11, 12, 23, 24)
    torso_indices = [11, 12, 23, 24]
    xs = [landmarks[i].x for i in torso_indices if i < len(landmarks)]
    ys = [landmarks[i].y for i in torso_indices if i < len(landmarks)]

    if not xs or not ys:
        # Fallback to all landmarks
        xs = [lm.x for lm in landmarks]
        ys = [lm.y for lm in landmarks]

    min_x, max_x = min(xs), max(xs)
    min_y, max_y = min(ys), max(ys)

    # Add padding
    pad_x = (max_x - min_x) * 0.2
    pad_y = (max_y - min_y) * 0.2

    return {
        'min_x': max(0, min_x - pad_x),
        'max_x': min(1, max_x + pad_x),
        'min_y': max(0, min_y - pad_y),
        'max_y': min(1, max_y + pad_y)
    }


def center_pose_landmarks(landmarks, bbox):
    """Normalize pose landmarks to be centered within their bounding box."""
    width = bbox['max_x'] - bbox['min_x']
    height = bbox['max_y'] - bbox['min_y']
    center_x = (bbox['min_x'] + bbox['max_x']) / 2
    center_y = (bbox['min_y'] + bbox['max_y']) / 2

    # Normalize to [-0.5, 0.5] range centered on body
    centered = []
    for lm in landmarks:
        if width > 0 and height > 0:
            norm_x = (lm.x - center_x) / max(width, height)
            norm_y = (lm.y - center_y) / max(width, height)
        else:
            norm_x = 0
            norm_y = 0
        centered.extend([norm_x, norm_y, lm.z])

    return centered


def draw_centered_pose(frame, landmarks, bbox, color, frame_section, num_bodies):
    """Draw a centered visualization of a pose in a section of the frame."""
    h, w = frame.shape[:2]
    section_width = w // num_bodies
    section_x = frame_section * section_width
    section_center_x = section_x + section_width // 2
    section_center_y = h // 2

    # Calculate scale based on bounding box
    bbox_width = bbox['max_x'] - bbox['min_x']
    bbox_height = bbox['max_y'] - bbox['min_y']
    scale = min(section_width * 0.8, h * 0.8) / max(bbox_width, bbox_height, 0.001)

    center_x = (bbox['min_x'] + bbox['max_x']) / 2
    center_y = (bbox['min_y'] + bbox['max_y']) / 2

    # Transform landmarks to centered position
    points = []
    for lm in landmarks:
        px = int(section_center_x + (lm.x - center_x) * scale)
        py = int(section_center_y + (lm.y - center_y) * scale)
        points.append((px, py))

    # Draw connections
    for start_idx, end_idx in POSE_CONNECTIONS:
        if start_idx < len(points) and end_idx < len(points):
            cv2.line(frame, points[start_idx], points[end_idx], color, 2)

    # Draw points
    for point in points:
        cv2.circle(frame, point, 4, color, -1)

    # Draw section divider
    if frame_section < num_bodies - 1:
        cv2.line(frame, (section_x + section_width, 0),
                 (section_x + section_width, h), (100, 100, 100), 1)


class HandTracker:
    def __init__(self, num_hands=2):
        model_path = get_model_path('hand')
        base_options = python.BaseOptions(model_asset_path=model_path)
        options = vision.HandLandmarkerOptions(
            base_options=base_options,
            running_mode=vision.RunningMode.IMAGE,
            num_hands=num_hands,
            min_hand_detection_confidence=0.5,
            min_hand_presence_confidence=0.5,
            min_tracking_confidence=0.5
        )
        self.detector = vision.HandLandmarker.create_from_options(options)

    def process(self, frame, rgb_frame, center=False):
        mp_image = mp.Image(image_format=mp.ImageFormat.SRGB, data=rgb_frame)
        results = self.detector.detect(mp_image)
        output = {
            "type": "hand",
            "bodies": [],
            "handedness": [],  # "Left" or "Right" for each hand
            "count": 0,
            "confidence": 0.0
        }

        if results.hand_landmarks and results.handedness:
            # Pair landmarks with handedness and sort for consistent ordering
            # Sort by: Left hands first, then Right hands
            # Within same handedness, sort by x position (leftmost first)
            hands = []
            for i, (landmarks, handedness_list) in enumerate(
                zip(results.hand_landmarks, results.handedness)
            ):
                handedness = handedness_list[0]
                hand_label = handedness.category_name  # "Left" or "Right"
                confidence = handedness.score
                # Get center x position for secondary sorting
                center_x = sum(lm.x for lm in landmarks) / len(landmarks)
                hands.append({
                    'landmarks': landmarks,
                    'label': hand_label,
                    'confidence': confidence,
                    'center_x': center_x
                })

            # Sort: Left before Right, then by x position
            hands.sort(key=lambda h: (0 if h['label'] == 'Left' else 1, h['center_x']))

            output["count"] = len(hands)
            confidences = []

            for i, hand in enumerate(hands):
                color = BODY_COLORS[i % len(BODY_COLORS)]
                draw_landmarks(frame, hand['landmarks'], HAND_CONNECTIONS, color)

                # Draw handedness label
                h, w = frame.shape[:2]
                wrist = hand['landmarks'][0]
                label_pos = (int(wrist.x * w), int(wrist.y * h) - 10)
                # cv2.putText(frame, hand['label'], label_pos,
                #            cv2.FONT_HERSHEY_SIMPLEX, 0.6, color, 2)

                coords = []
                for lm in hand['landmarks']:
                    coords.extend([lm.x, lm.y, lm.z])
                output["bodies"].append(coords)
                output["handedness"].append(hand['label'])
                confidences.append(hand['confidence'])

            if confidences:
                output["confidence"] = sum(confidences) / len(confidences)

        return output

    def close(self):
        self.detector.close()


class FaceTracker:
    def __init__(self, num_faces=1):
        model_path = get_model_path('face')
        base_options = python.BaseOptions(model_asset_path=model_path)
        options = vision.FaceLandmarkerOptions(
            base_options=base_options,
            running_mode=vision.RunningMode.IMAGE,
            num_faces=num_faces,
            min_face_detection_confidence=0.5,
            min_face_presence_confidence=0.5,
            min_tracking_confidence=0.5,
            output_face_blendshapes=False,
            output_facial_transformation_matrixes=False
        )
        self.detector = vision.FaceLandmarker.create_from_options(options)

    def process(self, frame, rgb_frame, center=False):
        mp_image = mp.Image(image_format=mp.ImageFormat.SRGB, data=rgb_frame)
        results = self.detector.detect(mp_image)
        output = {"type": "face", "bodies": [], "count": 0, "confidence": 0.0}

        if results.face_landmarks:
            output["count"] = len(results.face_landmarks)
            h, w = frame.shape[:2]

            for i, face_landmarks in enumerate(results.face_landmarks):
                color = BODY_COLORS[i % len(BODY_COLORS)]

                # Convert landmarks to pixel coordinates
                points = [(int(lm.x * w), int(lm.y * h)) for lm in face_landmarks]

                # Draw mesh connections
                for start_idx, end_idx in FACE_CONNECTIONS:
                    if start_idx < len(points) and end_idx < len(points):
                        cv2.line(frame, points[start_idx], points[end_idx], color, 1)

                # Draw key landmark points (eyes, nose, mouth corners)
                key_landmarks = [33, 133, 362, 263, 1, 61, 291]  # Key facial points
                for idx in key_landmarks:
                    if idx < len(points):
                        cv2.circle(frame, points[idx], 2, color, -1)

                coords = []
                for lm in face_landmarks:
                    coords.extend([lm.x, lm.y, lm.z])
                output["bodies"].append(coords)

            output["confidence"] = 1.0

        return output

    def close(self):
        self.detector.close()


class PoseTracker:
    def __init__(self, num_poses=1):
        model_path = get_model_path('pose')
        base_options = python.BaseOptions(model_asset_path=model_path)
        options = vision.PoseLandmarkerOptions(
            base_options=base_options,
            running_mode=vision.RunningMode.IMAGE,
            num_poses=num_poses,
            min_pose_detection_confidence=0.5,
            min_pose_presence_confidence=0.5,
            min_tracking_confidence=0.5
        )
        self.detector = vision.PoseLandmarker.create_from_options(options)
        self.num_poses = num_poses

    def process(self, frame, rgb_frame, center=False):
        mp_image = mp.Image(image_format=mp.ImageFormat.SRGB, data=rgb_frame)
        results = self.detector.detect(mp_image)
        output = {
            "type": "pose",
            "bodies": [],        # Raw coordinates
            "centered": [],      # Centered/normalized coordinates
            "bboxes": [],        # Bounding boxes
            "count": 0,
            "confidence": 0.0
        }

        if results.pose_landmarks:
            output["count"] = len(results.pose_landmarks)
            visibilities = []

            for i, pose_landmarks in enumerate(results.pose_landmarks):
                color = BODY_COLORS[i % len(BODY_COLORS)]

                # Get bounding box
                bbox = get_pose_bounding_box(pose_landmarks)
                output["bboxes"].append(bbox)

                # Draw on main frame (raw position)
                if not center:
                    draw_landmarks(frame, pose_landmarks, POSE_CONNECTIONS, color)

                # Extract raw coordinates
                raw_coords = []
                body_visibilities = []
                for lm in pose_landmarks:
                    raw_coords.extend([lm.x, lm.y, lm.z])
                    if hasattr(lm, 'visibility'):
                        body_visibilities.append(lm.visibility)

                output["bodies"].append(raw_coords)

                # Extract centered/normalized coordinates
                centered_coords = center_pose_landmarks(pose_landmarks, bbox)
                output["centered"].append(centered_coords)

                if body_visibilities:
                    visibilities.append(np.mean(body_visibilities))

            # Draw centered visualization if requested
            if center and results.pose_landmarks:
                for i, pose_landmarks in enumerate(results.pose_landmarks):
                    color = BODY_COLORS[i % len(BODY_COLORS)]
                    bbox = output["bboxes"][i]
                    draw_centered_pose(frame, pose_landmarks, bbox, color, i, len(results.pose_landmarks))

            if visibilities:
                output["confidence"] = float(np.mean(visibilities))

        return output

    def close(self):
        self.detector.close()


def output_json(data):
    """Output JSON to stdout and flush immediately."""
    print(json.dumps(data), flush=True)


def main():
    parser = argparse.ArgumentParser(description='MediaPipe Tracker')
    parser.add_argument('--type', choices=['hand', 'face', 'pose'],
                        default='hand', help='Type of tracking')
    parser.add_argument('--camera', type=int, default=0,
                        help='Camera device index')
    parser.add_argument('--list-cameras', action='store_true',
                        help='List available cameras and exit')
    parser.add_argument('--width', type=int, default=640,
                        help='Camera width')
    parser.add_argument('--height', type=int, default=480,
                        help='Camera height')
    parser.add_argument('--num-bodies', type=int, default=1,
                        help='Maximum number of bodies to detect')
    parser.add_argument('--center', action='store_true',
                        help='Center/normalize pose coordinates')
    parser.add_argument('--no-preview', action='store_true',
                        help='Disable preview window')
    args = parser.parse_args()

    # List cameras mode
    if args.list_cameras:
        cameras = list_cameras()
        output_json({"cameras": [c["name"] for c in cameras], "indices": [c["index"] for c in cameras]})
        return

    # Initialize camera
    cap = cv2.VideoCapture(args.camera)
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, args.width)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, args.height)

    if not cap.isOpened():
        output_json({"error": f"Cannot open camera {args.camera}"})
        sys.exit(1)

    # Initialize tracker based on type
    output_json({"status": "initializing", "type": args.type})

    if args.type == 'hand':
        tracker = HandTracker(num_hands=args.num_bodies)
    elif args.type == 'face':
        tracker = FaceTracker(num_faces=args.num_bodies)
    else:  # pose
        tracker = PoseTracker(num_poses=args.num_bodies)

    # Send ready message
    output_json({"status": "ready", "type": args.type, "camera": args.camera, "num_bodies": args.num_bodies})

    window_name = f"MediaPipe {args.type.capitalize()} Tracker"
    if args.center and args.type == 'pose':
        window_name += " (Centered)"

    # Start stdin monitor thread to detect when parent closes our stdin
    stdin_thread = threading.Thread(target=stdin_monitor, daemon=True)
    stdin_thread.start()

    global running
    while running:
        ret, frame = cap.read()
        if not ret:
            output_json({"error": "Failed to read frame"})
            break

        # Flip horizontally for mirror effect
        frame = cv2.flip(frame, 1)

        # Convert to RGB for MediaPipe
        rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

        # Process frame
        result = tracker.process(frame, rgb_frame, center=args.center)
        output_json(result)

        # Show preview
        if not args.no_preview:
            # Add info overlay
            info_text = f"{args.type.upper()} | Bodies: {result['count']} | Conf: {result['confidence']:.2f}"
            cv2.putText(frame, info_text, (10, 25), cv2.FONT_HERSHEY_SIMPLEX,
                       0.6, (255, 255, 255), 2)
            cv2.putText(frame, info_text, (10, 25), cv2.FONT_HERSHEY_SIMPLEX,
                       0.6, (0, 0, 0), 1)

            cv2.imshow(window_name, frame)
            key = cv2.waitKey(1) & 0xFF
            if key == ord('q') or key == 27:
                break

    # Cleanup
    try:
        tracker.close()
    except:
        pass
    try:
        cap.release()
    except:
        pass
    try:
        cv2.destroyAllWindows()
        cv2.waitKey(1)  # Needed to actually close the window
    except:
        pass
    output_json({"status": "stopped"})
    sys.stdout.flush()


if __name__ == '__main__':
    main()
