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

## Contents

Includes:

* libDaisy - hardware library for Daisy
* DaisySP - DSP library
* Blink - Basic example demonstrating a blink
* NewProject - an empty project, perfect for following along with the Guided Tutorial.

This also contains the following VS code tasks:

* Build Libraries: builds libDaisy, and DaisySP from scratch. This is only necessary when manually updating, or cloning for the first time.
* Build Blink: build the blink example
* Build NewProject: build the new project, an empty template meant as a starting place for following tutorials, or getting creative!
* Build: builds both examples
* Clean Blink: removes compiled Blink code
* Clean NewProject: removes compiled NewProject code
* Clean: removes all compiled project code

In addition, the following debug configurations are available:

* Debug Blink: debugs the Blink application
* Debug NewProject: debugs the NewProject application

**Note**: debugging an application from VS Code requires an ST-Link or similar probe, as well as the Cortex Debug extension for VS Code.
