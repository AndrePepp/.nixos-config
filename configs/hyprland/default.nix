{pkgs, lib, config, inputs, ...}: 

let 
        startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
		elephant &
                ${pkgs.waybar}/bin/waybar &
                ${inputs.awww.packages.${pkgs.system}.awww}/bin/awww-daemon &

                sleep 1

                ${inputs.awww.packages.${pkgs.system}.awww}/bin/awww img ${./wallpaper.png} &
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

#general = with config.colorScheme.colors;  {
#"col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
#"col.inactive_border" = "rgba(${base00}ff)";
#};

"$mod" = "SUPER";
"$terminal" = "ghostty";
"$browser" = "vivaldi";
"$search"  =  "walker";

input = {
"kb_layout" = "us";

"follow_mouse" = 1;
"repeat_delay" = 145;
"repeat_rate" = 65;

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
"$mod, SPACE, exec, $search"

#Move focus
"$mod, left, movefocus, l"
"$mod, right, movefocus, r"
"$mod, up, movefocus, u"
"$mod, down, movefocus, d"
"ALT, Tab, cyclenext "
"ALT, Tab, bringactivetotop "

#Switch workplace
"$mod, 1, workspace, 1"
"$mod, 2, workspace, 2"
"$mod, 3, workspace, 3"
"$mod, 4, workspace, 4"
" ,Shift_L, exec, sh ~/.nixos-config/configs/hyprland/doubleTapShift.sh"
" ,Control_L, exec, sh ~/.nixos-config/configs/hyprland/doubleTapCtrl.sh"

#Moves to a workplace directly
"$mod SHIFT, 1, movetoworkspace, 1"
"$mod SHIFT, 2, movetoworkspace, 2"
"$mod SHIFT, 3, movetoworkspace, 3"
"$mod SHIFT, 4, movetoworkspace, 4"
"$mod SHIFT, 5, movetoworkspace, 5"
"$mod SHIFT, 6, movetoworkspace, 6"
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

" ,switch:Lid Switch, exec, hyprlock"
];

binds =  { 
"drag_threshold" = 10;
};

bindm = [
"$mod, mouse:272, movewindow"
"$mod, mouse:272, togglefloating"
];

debug = {
overlay = false;
"disable_logs" = false;
"disable_time" = false;
"enable_stdout_logs" = true;
};

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
