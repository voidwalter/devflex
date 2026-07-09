{
  pkgs,
  extraPkgs ? [],
  ...
}:

pkgs.mkShell {
  name = "Go devlopment shell";

  packages = with pkgs; [
	go
	gotools
	gopls
	delve
	just
	gomod2nix
  ] ++ extraPkgs;
	
  hardeningDisable = [ "fortify" "all" ];
}
