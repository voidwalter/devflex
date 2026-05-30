{ pkgs ? import <nixpkgs> {}
, pkgsUnfree ? import <nixpkgs> { config = { allowUnfree = true; }; }
}: {
	rust = import ./envs/rust/shell.nix { inherit pkgs; };
}
