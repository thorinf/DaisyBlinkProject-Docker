#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$PWD"
LIBDAISY_DIR="$PROJECT_ROOT/libs/libDaisy"
DAISYSP_DIR="$PROJECT_ROOT/libs/DaisySP"

function ensure_dir_exists {
    local dirpath="$1"
    if [ ! -d "$dirpath" ]; then
        echo "ERROR: Directory not found: $dirpath"
        echo "       Make sure you’ve run 'git submodule update --init --recursive'."
        exit 1
    fi
}

ensure_dir_exists "$LIBDAISY_DIR"
ensure_dir_exists "$DAISYSP_DIR"

build_lib() {
    local dir="$1"
    local name
    name=$(basename "$dir")
    echo "building $name (path: $dir) …"
    (
        cd "$dir"
        # Only run “make clean” if the Makefile actually defines a clean target
        if grep -qE '^clean:' Makefile 2>/dev/null; then
            make -s clean
        fi
        if ! make -j -s; then
            echo "Failed to compile $name."
            exit 1
        fi
    )
    echo "$name: done."
}

build_lib "$LIBDAISY_DIR"
build_lib "$DAISYSP_DIR"

exit 0
