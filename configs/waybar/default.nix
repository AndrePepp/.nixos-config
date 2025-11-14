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

    modules-center = [ "hyprland/window" "mpris" ];

    modules-right = [ 
    "network"
    "bluetooth"
    "pulseaudio"
    "backlight"
    "temperature"
    "cpu"
    "battery"
    "clock"

    ];


    "hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
      format = "{icon} ";
      format-icons = {
      "1" = "";
      active = "";
      default = "";
    };
    };

  battery = {
    format = "{icon} {capacity}%";
    format-charging = "󱐋 {capacity}%";
    interval = 1;
    format-icons = ["󰂎" "󰁼" "󰁿" "󰂁" "󰁹"];
    tooltip = true;
  };

  network = {
    format-wifi = "   {essid} {signalStrength}%";
    format-ethernet = "󰊗  {ipaddr}/{cidr}";
    format-disconnected = "";
  };

  backlight = {
    format = "{icon}  {percent}%";
    format-icons = ["" ""];
    interval = 5;
    tooltip = false;
  };

  bluetooth = {
    format = " 󰂲 ";
    format-on = " {icon} ";
    format-off = " {icon} ";
    format-connected = " {icon} ";
    format-icons = {
      on="󰂯";
      off= "󰂲";
      connected= "󰂱";
    };
    tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
    tooltip-format-connected = "{controller_alias}\tconnected";
    tooltip-format-connected-battery = "{controller_alias}\t{device_battery_precentage}%";

  };
  
  cpu = {
    interval = 5;
    format = "{icon} {usage}%";
    format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
    tooltip-format = "Cur. load {load}\nAvg. freq {avg_frequency}\nC0: {usage0}{icon0}\nC1: {usage1}{icon1}\nC2: {usage2}{icon2}\nC3: {usage3}{icon3}\nC4: {usage4}{icon4}\nC5: {usage5}{icon5}\nC6: {usage6}{icon6}\nC7: {usage7}{icon7}";
  };

  clock = {
    interval = 60;
    timezone = "Europe/Chisinau";
    format = "  {:%H:%M}";
    format-alt = "{:%A, %B %d, %Y (%R)}";
  };
  
  pulseaudio = {
    format = "{icon}  {volume}%";
    format-bluetooth = "{icon}  {volume}% ";
    format-muted = " {icon} ";
    format-icons = {
        "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
        "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "  ";
        headphone = "";
        headset = "";
        phone = "";
        phone-muted = "";
        portable = "";
        car = "";
        default = ["" ""];
	muted = "";
    };

  };
}];
};

}
