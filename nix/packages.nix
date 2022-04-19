{ nixpkgs ? import <nixpkgs> { } }:
let pkgs = {
  atomi = (
    with import (fetchTarball "https://github.com/kirinnee/test-nix-repo/archive/refs/tags/v8.1.0.tar.gz");
    {
      inherit pls;
      pycharm = jetbrains.pycharm-professional;
    }
  );
  "Unstable 25th Janurary 2021" = (
    with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/2d77d1ce9018.tar.gz") { };
    {
      inherit
        pre-commit
        git
        shfmt
        shellcheck
        nixpkgs-fmt
        bash
        coreutils
        jq
        gnugrep
        gprolog;
      prettier = nodePackages.prettier;
    }
  );
}; in
with pkgs;
pkgs.atomi // pkgs."Unstable 25th Janurary 2021"
