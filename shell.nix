{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  # this will make all the build inputs from hello and gnutar
  # available to the shell environment
  buildInputs = [pkgs.nixops];
}
