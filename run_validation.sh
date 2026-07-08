#!/usr/bin/env bash
# Runs local KiBot validation and fabrication package generation using Docker.

set -e

# Verify docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: docker is not installed. Please install Docker to run local validation."
    exit 1
fi

PROJECT_DIR=$(pwd)
KIBOT_CONFIG="libs/pcb-devops/kibot_master.yaml"

if [ ! -f "$KIBOT_CONFIG" ]; then
    echo "Local master config not found in submodules. Fetching latest from GitHub..."
    curl -sSL https://raw.githubusercontent.com/purdue-rov/pcb-devops/main/kibot_master.yaml -o local_kibot.yaml
    KIBOT_CONFIG="local_kibot.yaml"
fi

echo "Starting KiBot Local Validation..."
docker run --rm -v "${PROJECT_DIR}:/workspace" -w /workspace setsoft/kibot:latest kibot -c "$KIBOT_CONFIG" -s all -d Generated_Outputs

echo "Validation completed successfully! Outputs are in the 'Generated_Outputs' directory."
