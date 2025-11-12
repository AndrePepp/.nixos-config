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
    height = 48;
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
    modules-left = [ "tray" "sway/workspaces" "sway/mode" "wlr/taskbar" ];

    modules-center = [ "sway/window" "custom/hello-from-waybar" ];

    modules-right = [ 
    "mpd"
    "custom/mymodule#with-css-id"
    "temperature"
    "cpu"
    "memory"
    "network"
    "disk"
    "battery"
    "clock"

    ];


    "sway/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
    };
    "custom/hello-from-waybar" = {
      format = "hello {}";
      max-length = 40;
      interval = "once";
      exec = pkgs.writeShellScript "hello-from-waybar" ''
        echo "from within waybar"
      '';
    };

  battery = {
  format = "{capacity}% {icon} {power}";
  on-click = "";
  };


}];
};

}
