{ config, pkgs, ... }:

{
  home.username = "jat";
  home.homeDirectory = "/home/jat";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = [
   ];

   # plain files is through 'home.file'.
  home.file = {
 
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
