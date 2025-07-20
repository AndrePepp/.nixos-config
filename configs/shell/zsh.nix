{ config, pkgs, lib, ...}:
{

	programs.zsh{
	 enable = true;
	 enableAutosuggestions = true;
	 enableCompletion = true;
	 enableLsColors = true;
	 autocd = true;
	 dotDir = ".config/zsh";

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
	  rebuild = "../../nixos-backup/nixos-backup-rebuild.sh";
	  update = "../../nixos-backup/nixos-backup-update.sh";
	  

	  l = "ls -l";

	  # Freq used directories
	  cdn = "cd /etc/nixos";
	 };

	};
};
