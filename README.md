# 📷 Fake Webcam Streamer


<p align="center">
  <img src="https://img.shields.io/badge/FFmpeg-007808.svg?style=for-the-badge&logo=FFmpeg&logoColor=white" alt="FFmpeg Badge"/>
  <img src="https://img.shields.io/badge/Ubuntu-E95420.svg?style=for-the-badge&logo=Ubuntu&logoColor=white" alt="Ubuntu Badge"/>
  <img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style=for-the-badge&logo=GNU-Bash&logoColor=white" alt="GNU Bash Badge"/>
  <img src="https://img.shields.io/badge/Linux-FCC624.svg?style=for-the-badge&logo=Linux&logoColor=black" alt="Linux Badge"/>
  <img src="https://img.shields.io/badge/GNOME%20Terminal-241F31.svg?style=for-the-badge&logo=GNOME-Terminal&logoColor=white" alt="GNOME Terminal Badge"/>
</p>

**Fake Webcam Streamer** is an automated Bash script designed to turn a video file into a virtual webcam on Ubuntu. Using `v4l2loopback` and `ffmpeg`, it creates a seamless virtual webcam experience that can be utilized in any video input-enabled application. Whether you’re simulating a live feed for testing, presentations, or just for fun, this script handles everything from device detection to cleanup, so you don't have to.

---

## 🚀 Features

- **🔧 Automated Setup:** Automatically detects and configures the next available video device.
- **🔄 Seamless Streaming:** Streams your chosen video file in a continuous loop as a virtual webcam.
- **🧹 Automatic Cleanup:** Ensures the virtual webcam module is removed when the script exits, leaving no traces.
- **⚠️ Error Handling:** Built-in checks for missing or invalid video files to prevent issues.

---

## 📋 Requirements

- **Ubuntu** (Tested on versions 20.04 and above)
- **v4l2loopback**: A kernel module to create virtual video devices. Refer to the official [v4l2loopback GitHub repository](https://github.com/umlaeute/v4l2loopback) for installation instructions.
- **ffmpeg**: A powerful multimedia framework to handle video streams. Install it using:
  ```bash
  sudo apt-get install ffmpeg
  ```
---

## 💻 Installation

1. **Clone the repository** to your local machine:
    ```bash
    git clone https://github.com/yourusername/fake-webcam-streamer.git
    cd fake-webcam-streamer
    ```

2. **Make the script executable:**
    ```bash
    chmod +x fake_webcam.sh
    ```

3. **Install the required dependencies** as mentioned in the **Requirements** section.

---

## ▶️ Usage

To use the script, pass the path to your video file as an argument:

```bash
./fake_webcam.sh /path/to/video.mkv
```

---

### Example:

```bash
./fake_webcam.sh ~/Videos/sample_video.mkv
```

---

### ⚙️ How It Works:

- **Cleanup Function:** A function is defined to remove the virtual webcam module when the script exits (triggered by signals like `SIGINT` or `SIGTERM`).
- **Validation:** The script checks if the video file path is provided and verifies its existence.
- **Device Detection:** Finds the next available video device number (`/dev/videoX`), loads the `v4l2loopback` module on that device, and streams the video in a loop using `ffmpeg`.

---

## 🔗 Notes

- The virtual webcam will be accessible under `/dev/videoX` (where `X` is the device number found by the script). You can use this in applications like Zoom, OBS, or any other video conferencing software.
- The video will loop continuously until the script is stopped.

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgements

- [v4l2loopback](https://github.com/umlaeute/v4l2loopback) - For creating virtual video devices on Linux.
- [ffmpeg](https://ffmpeg.org/) - For handling multimedia files and streams.
