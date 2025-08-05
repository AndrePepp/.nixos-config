{
pkgs,
lib,
...
}: {
programs.fastfetch.enable = true;
programs.fastfetch.settings = {
logo = {
    source = "./NixOs.png";
    width = 30;
    height = 15;
    padding = {
        top = 10;
        left = 5;
        right = 5;
    };
    printRemaining = false;
};

display = {
        showErrors = true;
        disableLinewarp = true;
        hideCursor = false;
        separator = " ∘ ";
};
        
modules = [
        "break"
        "cpu"
        "gpu"
        "de"
        "host"
        "kernel"
        "media"
        "disk"
        "diskio"
        "shell"
        "terminal"
        "theme"
        "title"
        "wm"
        "wmtheme"
        "datetime"
        "uptime"
        "packages"
        "physicalmemory"
        "os"
        "separator"
];
};
}
