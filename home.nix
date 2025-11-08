# User-level configuration (home.nix)
{
  config,
  pkgs,
  inputs,
  nix-colors,
  ...
}: {
  home.username = "seven";
  home.homeDirectory = "/home/seven";

  # User packages
  home.packages = with pkgs; [
    # Development
    nixd
    alejandra
    android-studio
    android-tools
    libgcc
    jdk

    # Applications
    vivaldi
    librewolf
    webcord
    kitty
    ghostty
    kitty-img
    kitty-themes
    alacritty
    alacritty-theme
    brightnessctl
    playerctl
    wineWowPackages.stableFull
    kdePackages.kate
    vlc
    lutris
    bottles
    prismlauncher
    qbittorrent
    ani-cli
    youtube-music
    hyprsysteminfo

    # Fun
    sl
    neo-cowsay
    lolcat
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
    libnotify
    mangohud
    protonup-ng
    btop
    fzf
    hyprdim
    hyprfreeze
    grim
    slurp
  ];

  imports = [
    nix-colors.homeManagerModules.default 
    inputs.walker.homeManagerModules.default
    ./configs/shell/zsh.nix
    #./configs/nvf/default.nix
    ./configs/hyprland/default.nix
    ./configs/fastfetch/default.nix
    ./configs/walker/default.nix
    ./configs/mako/default.nix
    ./configs/wob/default.nix
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
      settings = {
      user.name = "Andre";
      user.email = "ytdragonby@gmail.com";


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
    satty.enable = true;

    # File manager
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
   
  services = {

  easyeffects.enable = true;

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
