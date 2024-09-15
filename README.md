# DaisyBlinkProject

Basic Blink Project with all required libraries, etc.

## Get Started

If cloning this repo from Github, you will want to do so with the submodules with:

```console
git clone https://github.com/electro-smith/DaisyBlinkProject --recurse-submodules
```

if you've already cloned the repo without this you can fill the submodules by running the following:

```console
git submodule update --init
```

Alternatively, you can avoid using git, and building libraries if you download the latest zip compiled zip file in the releases.

## Setup

### Dev Containers

As this repository is intended for use with [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers) you will need the following things installed:

* [WSL, if using Windows](https://docs.docker.com/desktop/wsl/)
* Docker
* Visual Studio Code
* Dev Containers Extention

This guide won't extensively cover the setup of these steps, but there are plent of guides available online.
For those using Windows and macOS, the [Docker Desktop](https://www.docker.com/products/docker-desktop/) application can make installation very easy.
For Linux distros [installing via `apt`](https://docs.docker.com/engine/install/ubuntu/) may be preffered. 

If this is your first time working with Dev Containers, then it's a good idea to check you can open a project in a container before proceeding.

### Windows Subsystem for Linux (WSL)

If using Docker via WSL you will need to [connect the USB device to WSL](https://learn.microsoft.com/en-gb/windows/wsl/connect-usb#attach-a-usb-device.).
Once WSL has access to the device you can subsequently access it within the Docker container.

Following the instuctions for installing USBIPD in the link above. Once completed, proceed to the first step by opening PowerShell in _administrator_ mode and entering the following command:

```powershell
usbipd list
```

The output ought to look similar to the table below, but likely with more devices. Make note of the `BUSID` values for the `DFU in FS Mode` device.

| **BUSID** | **VID:PID** | **Device**         | **State**   |
|-----------|-------------|--------------------|-------------|
| 1-3       | ...         | DFU in FS Mode     | ...         |
| ...       | ...         | ...                | ...         |

Using the `BUSID` values, enter the following command:

```powershell
usbipd bind --busid 1-3
usbipd attach --busid 1-3 --wsl --auto-attach
```

Without `auto-attach` the device will attach once which will allow you to use DFU. However, once the device is reconnected you will need to execute the command again.
If `auto-attach` is used, the command will allow to PowerShell to attach the device to WSL again so long as the terminal stays open.

## Contents

Includes:

* libDaisy - hardware library for Daisy
* DaisySP - DSP library
* Blink - Basic example demonstrating a blink

This also contains the following VS code tasks:

* Build Libraries: builds libDaisy, and DaisySP from scratch. This is only necessary when manually updating, or cloning for the first time.
* Build: build the blink example
* Clean: removes compiled Blink code
* Program DFU: programs the Blink.bin file via USB
* Build and Program DFU: Rebuilds the program and downloads it via USB DFU

In addition, the following debug configurations are available:

* Debug Blink: debugs the Blink application

**Note**: debugging an application from VS Code requires an ST-Link or similar probe, as well as the Cortex Debug extension for VS Code.
