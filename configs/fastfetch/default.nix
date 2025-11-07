{
pkgs,
lib,
...
}: {
programs.fastfetch.enable = true;
programs.fastfetch.settings = {
logo = {
    source = "\${HOME}/.nixos-config/configs/fastfetch/NixOs.png";
    width = 30;
    height = 15;
    padding = {
        top = 3;
        left = 3;
        right = 5;
    };
    printRemaining = false;
};

display = {
        separator = " ∘ ";
};
        
modules = [
        "break"

        {
        type = "colors";
        symbol = "circle";
        }

       "break"

        "title"
        "os"
        "host"

        "separator"

        "terminal"
        "shell"
        "wm"

        "separator"

        {
        type = "cpu";
        key = "CPU";
        format = "{name} | {cores-physical}";
        }
        {
        type = "gpu";
        key = "GPU";
        format = "{name}";
        }
        {
        type = "disk";
        key = "Disk";
        showExternal = false;
        format = "{size-used} / {size-total} ({size-percentage})";
        }
        {
        type = "packages";
        key =  "Pkgs";
        format = "{all}, {nix-user} (user)";
        }

        "separator"

        {
        type = "datetime";
        key = "Time";
        format = "{hour-pretty} : {minute-pretty}";
        }
        {
        type = "datetime";
        key = "Calendar";
        format = "{day-pretty}/{month-pretty}/{year}";
        }
        "uptime"

        "break"

        {
        type = "colors";
        symbol = "circle";
        }

        "break"
];
};
}
