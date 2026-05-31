{
  description = "Xiaomi Unlock Tool Env";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            android-tools   # adb, fastboot
            openjdk17       # Java runtime for XiaoMiTool V2
            python3         # Python for MiUnlockTool scripts
            usbutils        # lsusb
            libusb1         # USB library dependencies
          ];

          shellHook = ''
            echo "Check device: lsusb"
            echo "Check fastboot: fastboot devices"
          '';
        };
      }
    );
}   
