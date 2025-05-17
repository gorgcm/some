### How to run:
`./build.sh`

`wasm-pack build --target web`

`wasm-pack build --target web`
`dir pkg`
`copy pkg\*.js .`
`copy pkg\*.wasm .`

`wasm-pack --version`
`cargo install wasm-pack`

`npm install -g http-server`

`http-server`




# Optimized Project Structure and README

## Project Structure
```
emoji-translator/
├── Cargo.toml          # Optimized Rust project configuration
├── build.sh            # Optimized build script
├── index.html          # Optimized web interface
├── src/
│   └── lib.rs          # Optimized WebAssembly module
├── static/
│   ├── glove.6B.50d.txt # Word embeddings (download instructions below)
│   └── emoji.json      # Emoji mapping data
└── README.md           # This file
```

## Setup Instructions

1. **Install Prerequisites**:
   ```bash
   # Install Rust and wasm-pack
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
   
   # Install wasm-opt for additional optimization (optional)
   npm i -g wasm-opt
   ```

2. **Download Required Data Files**:
   - Word embeddings: Download GloVe from https://nlp.stanford.edu/projects/glove/
   - Place `glove.6B.50d.txt` in the project root
   - Create an `emoji.json` file with emoji-to-keywords mapping

3. **Build the Project**:
   ```bash
   chmod +x build.sh
   ./build.sh
   ```

4. **Run the Application**:
   ```bash
   # Using a local server (python example)
   python3 -m http.server 8080
   # Then open http://localhost:8080 in your browser
   ```

## Performance Optimizations

### Rust/WASM Optimizations
- Used HashMap for O(1) lookups instead of iterating through vectors
- Pre-allocated memory for collections to reduce reallocations
- Combined multiple passes into single operations for vector calculations
- Optimized cosine similarity calculation for SIMD compatibility
- Inline critical functions for better compiler optimization
- Added fast paths for exact keyword matches

### Build Process Optimizations
- RUSTFLAGS to enable SIMD, atomics, and bulk memory features
- LTO (Link Time Optimization) for smaller binary size
- Reduced codegen units for better optimization across functions
- Panic=abort to reduce binary size by removing panic handling code
- wasm-opt based additional optimizations

### Frontend Optimizations
- Cached DOM element references for better performance
- Implemented debouncing for input events
- Used requestAnimationFrame for smooth progress display
- Added dark mode support using prefers-color-scheme
- Parallel loading of WASM module and data files
- Modern async/await pattern for better readability
- Error handling throughout the application

## Planned Enhancements
- Worker thread for translation to keep UI responsive
- Local storage caching of processed embeddings
- Compression of embedding data for faster loading
- Progressive loading of large data files
- Text preprocessing improvements for better translation quality

## License
MIT
