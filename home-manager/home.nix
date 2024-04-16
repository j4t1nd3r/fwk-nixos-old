{ config, pkgs, plasma-manager, ... }:

{
  imports = [
    plasma-manager.homeManagerModules.plasma-manager
  ];

  programs.plasma.enable = true;
  programs.plasma.theme = "Breeze-Dark";
  
  # set allowunFree
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home.username = "jat";
  home.homeDirectory = "/home/jat";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = [
     
   ];

  home.file = {

  };
  
  home.file.".config/warp-terminal/user_preferences.json".source = ../configs/warp-terminal.json;

  home.sessionVariables = {
    EDITOR = "code";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName  = "Jatinder Randhawa";
    userEmail = "j4t1nd3r@gmail.com";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      bbenoist.nix
      github.vscode-pull-request-github
    ];
  };

}
