{
  pkgs,
  extraPkgs ? [],
  ...
}:
pkgs.mkShell {
  name = "standard rust-env";

  packages = with pkgs; [
		rustc
		cargo
  ] ++ extraPkgs;
}
