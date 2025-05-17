
#!/bin/bash
# Check for wasm-pack
command -v wasm-pack &>/dev/null || cargo install wasm-pack

# Build and copy files
wasm-pack build --target web
cp pkg/*.js .
cp pkg/*.wasm .
