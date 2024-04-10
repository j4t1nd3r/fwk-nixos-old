{ config, pkgs, ... }:

{
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
      dracula-theme.theme-dracula
      bbenoist.nix
    ];
  };

  # no warp module in home manager, direct overwrite of config file
  home.activationScripts.setFontSize = {
    text = ''
      if [ -f $HOME/.config/warp-terminal/user_preferences.json ]; then
        jq '.prefs.FontSize = "9.0"' $HOME/.config/warp-terminal/user_preferences.json > $HOME/.config/warp-terminal/tmp.$$.json && mv $HOME/.config/warp-terminal/tmp.$$.json $HOME/.config/warp-terminal/user_preferences.json
      fi
    '';
    phase = "setup";
  };

}
