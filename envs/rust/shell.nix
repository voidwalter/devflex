{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    rustc
    cargo
    
    # Development Tools
    rust-analyzer
    cargo-edit
    pkg-config
    clang     
    
    rust-src        
  ];

  # environment variable for rust-analyzer
  RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  
  # Enable backtraces for debugging
  RUST_BACKTRACE = "1";
} 
