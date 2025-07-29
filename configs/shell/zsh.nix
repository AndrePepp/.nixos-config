{ config, pkgs, lib, ...}:
{

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


	 shellAliases = {

	  #shell scrips that save the configs
	  q = "exit";
	  sudon = "sudo -E nvim";
	  rebuild = "cdn & ./nixos-backup/nixos-backup-rebuild.sh";
	  update = "cdn & ./nixos-backup/nixos-backup-update.sh";
	  frebuild = "sudo nixos-rebuild switch --flake /etc/nixos#seven";
	  gitsync = "cdn & ./nixos-backup/nixos-backup.sh"; 

	  l = "ls -l";

	  # Freq used directories
	  cdn = "cd /etc/nixos";
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
	  oh-my-posh.useTheme = "catppuccin-mocha"; 
	};
}
