{ pkgs }:

let
  imgLink = "https://github.com/j4t1nd3r/fwk-nixos/blob/feat/fmwk/assets/anime-ghost_in_the_shell_1995-cyberpunk-futuristic_city-ghost_in_the_shell-night-432245.jpeg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "1qyq05ghxvfncs873jmw4lzf8sl3rg3502zgvangqcj7mdqb02zm";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
   '';
}