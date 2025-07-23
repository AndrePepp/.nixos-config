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
#	 enableLsColors = true;
#	 autoCd = true;
#	 dotDir = ".config/zsh";

#	 shellInit = "fastfetch";

	 history = {

	  expireDuplicatesFirst = true;
	  ignoreSpace = true;
	  save = 15000;
	  share = true;

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
	 };

#	 ohMyZsh = {
#
#	  enable = true;
#
#	 };

	};
}
