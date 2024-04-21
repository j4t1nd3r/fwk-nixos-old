{ config, pkgs, plasma-manager, ... }:

{
  imports = [
    plasma-manager.homeManagerModules.plasma-manager
    inputs.hyprland-nix.homeManagerModules.default
  ];

  programs.home-manager.enable = true;
  
  home = {
    username = "jat";
    homeDirectory = "/home/jat";
    stateVersion = "23.11";

    packages = with pkgs; [
      starship
      git
      warp-terminal
      jq
      xclip
      flameshot
      neofetch
      vscode
      google-chrome
      firefox
      discord
      spotify
    ];

    file = {
      ".config/warp-terminal/user_preferences.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-fwk-system//configs/warp-terminal.json"; # warp terminal
      ".config/Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-fwk-system/configs/vscode-settings.json"; # vscode settings.json
       
    };

    sessionVariables = {
      EDITOR = "code";
    };
  };

  wayland.windowManager.hyprland = {
          enable = true;
          reloadConfig = true;
          systemdIntegration = true;
          # recommendedEnvironment = false;
          config = {
          };
      };  

  # set allowunFree
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };
  };

  programs.git = {
    enable = true;
    userName  = "Jatinder Randhawa";
    userEmail = "j4t1nd3r@gmail.com";
  };

  programs.bash.enable = true;
  
  programs.starship = {
  enable = true;
   enableBashIntegration = true; 
  # settings = pkgs.lib.importTOML ../starship.toml;
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

