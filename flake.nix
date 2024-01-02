{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
  
  outputs = { self, nixpkgs, rust-overlay }: let
    rust-version = "stable";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ (import rust-overlay) ];
    };
  in {

    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        rust-bin."${rust-version}".latest.default
      ];
    };
  };
}
