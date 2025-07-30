{pkgs, lib, ...} {

wayland.windowManager.hyprland = {

        enable = true;
        systemd.enable = true;

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
