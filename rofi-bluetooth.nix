with import <nixpkgs> {};

let
in
stdenv.mkDerivation rec {
  name = "rofi-bluetooth";
  src = pkgs.fetchFromGitHub {
    owner = "ClydeDroid";
    repo = "rofi-bluetooth";
    rev = "311ee43f655de94bbd4c35554f1071ec1bc64d78";
    sha256 = "0hdih3x7zhnkyrxvjfrz5ms668hcfgjqbixkkyqw64pkf7cgwdp0";
  };
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    makeWrapper $src/rofi-bluetooth $out/bin/rofi-bluetooth \
      --prefix PATH : ${lib.makeBinPath [ bluez rofi ]}
  '';
}
