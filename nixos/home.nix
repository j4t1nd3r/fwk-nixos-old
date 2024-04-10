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
  xdg.configFile."warp-terminal/user_preferences.json".text = builtins.toJSON {
    prefs = {
      AIAssistantRequestLimitInfo = "{\"limit\":100,\"num_requests_used_since_refresh\":1,\"next_refresh_time\":\"2024-04-11T11:05:35.461882682Z\"}";
      WelcomeTipsFeaturesUsed = "[{\"Hint\":\"BlockSelect\"},{\"Hint\":\"CreateBlock\"},{\"Action\":\"CommandPalette\"},{\"Hint\":\"BlockAction\"},{\"Action\":\"WarpAI\"}]";
      EmacsBindingsBannerState = "\"Dismissed\"";
      ExperimentId = "3cbceec8-ffbf-4696-abe6-d3375cadc82e";
      ShowWarningBeforeQuitting = "false";
      OpenFileEditor = "\"VSCode\"";
      NotebookFontSize = "9.0";
      HasAutoOpenedWelcomeFolder = "true";
      ReceivedReferralTheme = "\"Inactive\"";
      FontSize = "9.0";
      Shortcuts = "true";
      AutosuggestionAcceptedCount = "2";
      ChangelogVersions = "{\"v0.2024.03.19.08.01.stable_01\":true}";
    };

}
