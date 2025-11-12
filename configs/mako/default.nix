{
config,
pkgs,
...
}: {

services.mako = {

enable = true;

settings = {

  ## Global Settings

  font = "JetBrains Mono 10";
  width = 350;
  height = 120;

  margin = 15;
  padding = 10;
  border-size = 2;
  border-radius = 8;

  background-color = "#1e1e2eff";
  text-color = "#e0e0e0ff";
  border-color = "#6c7086ff";
  progress-color = "over #89b4faff";

  anchor = "top-right";
  layer = "overlay";

  icons = true;
  max-icon-size = 64;
  default-timeout = 50000;
  ignore-timeout = false;
  actions = true;

  sort = "-time";
  max-visible = 5;
  max-history = 15;

  markup = true;
  text-alignment = "left";

  # Criteria sections
    # Actionable notifications appear top left
      "actionable=true" = {
      anchor = "top-right";
      border-color = "#89b4faff";
    };

    # Critical notifications
      "urgency=critical" = {
      background-color = "#2f0a0aff";
      border-color = "#ff5555ff";
      text-color = "#ffffffff";
      default-timeout = 0;
      anchor = "top-left";
    };

    # Low urgency notifications
      "urgency=low" = {
      background-color = "#181825ee";
      text-color = "#b0b0b0ff";
    };
};

};

}
