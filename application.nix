with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "nix-php-simple";
  src = ./data;
  installPhase = ''
    mkdir -p "$out/web"
    cp -ra * "$out/web"
  '';
  buildInputs = [nixops];
}
