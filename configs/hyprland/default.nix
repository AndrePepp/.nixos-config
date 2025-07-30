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

"$mod" = "SUPER";
"$terminal" = "alacritty";
"$browser" = "vivaldi";

bind = [

#Basic keybinds
"$mod, Q, exec, $terminal"
"$mod, C, killactive,"
"$mod, L, exit,"

#Move focus
"$mod, left, movefocus, l"
"$mod, right, movefocus, r"
"$mod, up, movefocus, u"
"$mod, down, movefocus, d"

#Switch workplace
"$mod, 1, workspace, 1"
"$mod, 2, workspace, 2"
"$mod, 3, workspace, 3"
"$mod, 4, workspace, 4"

];

bindl = [

#Laptop multimedia keys for volume and LCD brightness
" ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
" ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
" ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
" ,XF86AudioMicMute, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ toggle"
" ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+" 
" ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"

];

};

};

programs = {
        hyprlock.enable = true;
};

services = {
        hypridle.enable = true;
        hyprpaper.enable = true;
        hyprsunset.enable = true;
        hyprpolkitagent.enable = true;
};

}
