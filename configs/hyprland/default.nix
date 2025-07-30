{pkgs, lib, config, ...}: 

let 
        startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
                ${pkgs.waybar}/bin/waybar &
                ${pkgs.swww}/bin/swww init &

                sleep 1

                ${pkgs.swww}/bin/swww img ${./wallpaper.png} &
                '';
in
        {

wayland.windowManager.hyprland = {

        enable = true;
        systemd.enable = true;



settings = {
exec-once = ''${startupScript}/bin/start''; 
};
};

programs = {
        
        quickshell.systemd.target = "hyprland-session.target";
        hyprlock.enable = true;
};

services = {
        hypridle.enable = true;
        hyprpaper.enable = true;
        hyprsunset.enable = true;
        hyprpolkitagent.enable = true;
};

}
