{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;

    autosuggestion = {
      enable = true;
    };

    syntaxHighlighting = {
      enable = true;
    };

    enableCompletion = true;
    autocd = true;

    enableVteIntegration = true;

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      append = true;
      save = 15000;
      share = true;
    };

    historySubstringSearch = {
      enable = true;
      searchDownKey = "^[[B";
      searchUpKey = "^[[A";
    };


    initContent = ''
        ${pkgs.fastfetch}/bin/fastfetch
    '';

    shellAliases = {
      #shell scrips that save the configs
      q = "exit";
      test = " ./nixos-backup/test.sh";
      rebuild = " ./nixos-backup/nixos-backup-rebuild.sh";
      update = " ./nixos-backup/nixos-backup-update.sh";
      frebuild = "sudo nixos-rebuild switch --flake /etc/nixos#seven";
      gitsync = " ./nixos-backup/nixos-backup.sh";

      l = "ls -l";

      # Freq used directories
      cdn = "cd ~/.nixos-config";
      cdd = "cd ~/Downloads";
    };

    prezto = {
      enable = true;

      editor.dotExpansion = true;
    };
  };

  programs = {
    dircolors.enableZshIntegration = true;
    fzf.enableZshIntegration = true;
    oh-my-posh.enable = true;
    oh-my-posh.enableZshIntegration = true;
    #	  oh-my-posh.useTheme = "darkblood";
    oh-my-posh.useTheme = "catppuccin_mocha";
  };
}
