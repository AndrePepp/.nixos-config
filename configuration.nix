# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  security.sudo-rs.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT = "ro_RO.UTF-8";
    LC_MONETARY = "ro_RO.UTF-8";
    LC_NAME = "ro_RO.UTF-8";
    LC_NUMERIC = "ro_RO.UTF-8";
    LC_PAPER = "ro_RO.UTF-8";
    LC_TELEPHONE = "ro_RO.UTF-8";
    LC_TIME = "ro_RO.UTF-8";
  };

  hardware.graphics.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
  
# Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
                "bluez5.enable-sbc-xq" = true;
                "bluez5.enable-msbc" = true;
                "bluez5.enable-hw-volume" = true;

                "bluez5.roles" = [ "a2dp_sink" "a2dp_source" ];
        };
  };

  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.seven = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "7xTe";
    hashedPassword = "$y$j9T$GajOvbyrpfZC6nBw6gnex/$JouPO.vbGkWqYSaexxoJr5EwC6dOeCGQ5REqDrvV0q7";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  home-manager.backupFileExtension = "backup";

  virtualisation.docker.enable = true;

  services.flatpak.enable = true;

  programs = {
    zsh.enable = true;
    java.enable = true;
    dconf.enable = true;

    hyprland.enable = true;
    hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    hyprland.xwayland.enable = true;

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };

    gamemode.enable = true;

    git = {
      enable = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };


   # Allow unfree packages
  nixpkgs.config = {
  allowUnfree = true;
  permittedInsecurePackages = [
    "electron-36.9.5"
  ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    wget
    inputs.awww.packages.${pkgs.system}.awww
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    noto-fonts
    fira-code-symbols
  ];

  # Automatic updates
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "daily";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
