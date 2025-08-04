# User-level configuration (home.nix)
{
  config,
  pkgs,
  inputs,
  nix-colors,
  ...
}: {
  home.username = "andre";
  home.homeDirectory = "/home/andre";

  # User packages
  home.packages = with pkgs; [
    # Development
    nixd
    alejandra
    android-studio
    android-tools
    libgcc
    jdk24

    # Applications
    vivaldi
    librewolf
    discord
    kitty
    kitty-img
    kitty-themes
    alacritty
    alacritty-theme
    brightnessctl
    playerctl
    pulseaudio
    wineWowPackages.stableFull
    kdePackages.kate
    vlc
    lutris
    bottles
    prismlauncher
    qbittorrent
    ani-cli

    # Fun
    sl
    neo-cowsay
    lolcat
    fastfetch
    nitch
    cpufetch
    cmatrix
    oneko
    lolcat
    jp2a
    cbonsai
    cava
    astroterm
    tplay

    #Misc
    mangohud
    protonup
    btop
    fzf
  ];

  imports = [
    nix-colors.homeManagerModules.default 

    ./configs/shell/zsh.nix
    ./configs/nvf/default.nix
    ./configs/hyprland/default.nix
  ];

  # ProtonUp
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  # Program configurations
  programs = {
    # Git
    git = {
      enable = true;
      userName = "Andre";
      userEmail = "ytdragonby@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };

    # Shell
    bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        ll = "ls -la";
        l = "ls -l";
        rebuild = "./nixos-backup/nixos-backup-rebuild.sh";
        update = "./nixos-backup/nixos-backup-update.sh";
      };
    };

    # Alacritty theme
    alacritty.theme = "inferno";

    waybar.enable = true;

    # File manager
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };

  # Dotfiles and configuration files
  home.file = {
    # Example: custom dotfile
    # ".config/example/config.yml".text = ''
    #   setting: value
    # '';
  };

  # Environment variables
  home.sessionVariables = {
    BROWSER = "vivaldi";
    TERMINAL = "alacritty";
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with.
  home.stateVersion = "25.05";
}
