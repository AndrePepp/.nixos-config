{ config, pkgs, lib, ...}:
{

	programs.zsh = {

	 enable = true;
	 enableAutosuggestions = true;
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

	 initContent = '' 

	  abbrev-alias q = "exit";
	  abbrev-alias sudon = "sudo -E nvim";
	  abbrev-alias v = "nvim";

	 '';

	 shellAliases = {

	  #shell scrips that save the configs
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
