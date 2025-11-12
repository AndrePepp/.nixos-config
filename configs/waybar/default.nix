{
pkgs,
config,
...
} :  {

programs.waybar =  {
enable = true;

settings = [{

    layer = "top";
    position = "top";
    mode = "dock";
    height = 40;
    passthrough = false;
    gtk-layer-shell = true;
    ipc = true;
    fixed-center = true;
    margin-top = 0;
    margin-left = 5;
    margin-right = 5;
    margin-bottom = 0;
    output = [
      "eDP-1"
      "HDMI-A-1"
    ];
    modules-left = [ "tray" "hyprland/workspaces" "hyprland/mode" ];

    modules-center = [ "hyprland/window" ];

    modules-right = [ 
    "network"
    "bluetooth"
    "pulseaudio"
    "backlight"
    "temperature"
    "cpu"
    "memory"
    "disk"
    "battery"
    "clock"

    ];


    "hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
      format = "{icon}";
      format-icons = {
      "1" = "";
      active = "";
      default = "";
    };
    };

  battery = {
    format = "{icon} {capacity}%";
    format-charging = "󱐋 {capacity}%";
    interval = 1;
    format-icons = ["󰂎" "󰁼" "󰁿" "󰂁" "󰁹"];
    tooltip = true;
  };


}];
};

}
