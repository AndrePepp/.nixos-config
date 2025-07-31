{pkgs, lib, config, ...}: 

let 
        startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
                ${pkgs.waybar}/bin/waybar &
                ${pkgs.swww}/bin/swww-daemon &

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

monitor = ", prefered, auto, 1";
windowrule = "nofocus, class:^$, title:^$, xwayland:1, floating: 1, fullscreen:0, pinned: 0";

"$mod" = "SUPER";
"$terminal" = "alacritty";
"$browser" = "librewolf";
"$doubleShift" = "SHIFT+SHIFT";
"$doubleCtrl" = "CTRL+CTRL";

input = {
"kb_layout" = "us";

"follow_mouse" = 1;
"repeat_delay" = 125;
"repeat_rate" = 70;

touchpad = {
"natural_scroll" = true;
};
};

bind = [

#Basic keybinds
"$mod, Q, exec, $terminal"
"$mod, C, killactive,"
"$mod, L, exit,"
"$mod, B, exec, $browser"
"$mod, P, togglefloating"

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
"$doubleShift, , workspace, e-1"
"$doubleCtrl, , workspace, e+1"

"$mod SHIFT, 1, movetoworkspace, 1"
"$mod SHIFT, 2, movetoworkspace, 2"
"$mod SHIFT, 3, movetoworkspace, 3"
"$mod SHIFT, 4, movetoworkspace, 4"
];

bindl = [

# Laptop multimedia keys for volume and LCD brightness
" ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
" ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
" ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
" ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
" ,XF86MonBrightnessUp, exec, brightnessctl set 5%+" 
" ,XF86MonBrightnessDown, exec, brightnessctl set 5%-"

# Numpad sound control
"  ,XF86AudioNext, exec, playerctl next"
"  ,XF86AudioPlay, exec, playerctl play-pause"
"  ,XF86AudioPrev, exec, playerctl previous"
"  ,XF86AudioStop, exec, playerctl stop"
];

misc = {

"disable_hyprland_logo" = true;
"middle_click_paste" = false;

};
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
