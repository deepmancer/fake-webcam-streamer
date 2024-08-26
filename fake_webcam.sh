#!/bin/bash

# Fake Webcam Streamer
# A script to stream a video file as a virtual webcam using v4l2loopback and ffmpeg

# Function to clean up on exit
cleanup() {
    echo "Cleaning up..."
    sudo modprobe -r v4l2loopback
    echo "v4l2loopback module removed."
}

# Trap signals (e.g., SIGINT, SIGTERM) to run the cleanup function
trap cleanup EXIT

# Function to display usage information
usage() {
    echo "Usage: $0 /path/to/video.mkv"
    exit 1
}

# Check if video file path is provided as an argument
if [ -z "$1" ]; then
    echo "Error: No video file provided."
    usage
fi

# Assign the video file path to a variable
VIDEO_PATH="$1"

# Validate the provided video file path
if [ ! -f "$VIDEO_PATH" ]; then
    echo "Error: The specified file does not exist: $VIDEO_PATH"
    usage
fi

# Function to find the next available video device number
get_next_video_nr() {
    local n=0
    while [ -e "/dev/video$n" ]; do
        n=$((n + 1))
    done
    echo $n
}

# Get the next available video device number
VIDEO_NR=$(get_next_video_nr)

# Load the v4l2loopback module with the dynamically assigned video number
echo "Loading v4l2loopback module on /dev/video$VIDEO_NR..."
sudo modprobe v4l2loopback video_nr=$VIDEO_NR card_label="VirtualCam" exclusive_caps=1

# Stream the video in a loop to the virtual webcam
echo "Streaming video to /dev/video$VIDEO_NR..."
ffmpeg -stream_loop -1 -re -i "$VIDEO_PATH" -map 0:v -f v4l2 /dev/video$VIDEO_NR

