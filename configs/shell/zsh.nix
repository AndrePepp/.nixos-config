{ config, pkgs, lib, ...}:
{

	programs.zsh = {

	 enable = true;
	 enableAutosuggestions = true;
	 enableCompletion = true;
	 enableLsColors = true;

	 shellInit = "fastfetch";

	 history = {

 	  expireDuplicatesFirst = true;
	  ignoreSpace = true;
	  save = 15000;
	  share = true;

	 };

	 initExtra = '' 

	  abbrev-alias q = "exit";
	  abbrev-alias sudon = "sudo -E nvim";
	  abbrev-alias v = "nvim";

	 '';

	 shellAliases = {

	  #shell scrips that save the configs
	  rebuild = "./nixos-backup/nixos-backup-rebuild.sh";
	  update = "./nixos-backup/nixos-backup-update.sh";
	  frebuild = "sudo nixos-rebuild switch --flake /etc/nixos#seven";
	  

	  l = "ls -l";

	  # Freq used directories
	  cdn = "cd /etc/nixos";
	 };

	 ohMyZsh = {

	  enable = true;

	 };

	};
}
