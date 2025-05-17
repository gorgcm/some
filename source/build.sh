#!/bin/bash
# build.sh - Script to build the WebAssembly module

# Ensure wasm-pack is installed
if ! command -v wasm-pack &> /dev/null; then
    echo "wasm-pack is not installed. Installing..."
    cargo install wasm-pack
fi

# Build the WebAssembly module
echo "Building WebAssembly module..."
wasm-pack build --target web

# Copy the necessary files to the web directory
echo "Copying files to the web directory..."
cp -r pkg/*.js .
cp -r pkg/*.wasm .

echo "Build complete! Open index.html in your browser to test the emoji translator."