# Apps/an-anime-team.nix
{inputs, ...}: {
  imports = [inputs.aagl.nixosModules.default];
  nix.settings = inputs.aagl.nixConfig; # Set up Cachix
  programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
  #programs.anime-games-launcher.enable = true;
  programs.honkers-railway-launcher.enable = true;
  #programs.honkers-launcher.enable = true;
  #programs.wavey-launcher.enable = true;
  programs.sleepy-launcher.enable = true;
}
