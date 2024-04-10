{ config, pkgs, ... }:

{
  home.username = "jat";
  home.homeDirectory = "/home/jat";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = [
     
   ];

  home.file = {
    
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName  = "Jatinder Randhawa";
    userEmail = "j4t1nd3r@gmail.com";
  };

#   programs.vscode = {
#     enable = true;
#     extensions = with pkgs.vscode-extensions; [
#       dracula-theme.theme-dracula
#       bbenoist.Nix
#     ];
#   };
}
