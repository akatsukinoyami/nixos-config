{config, pkgs, ...}:
{
  dconf = {
    enable = true;
    settings = {
      "system/locale" = {
        region = "ru_RU.UTF-8";
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click = true;
        two-finger-scrolling-enabled = true;
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file://home/katsu/nixos-config/common/background.jpg"
      };
    };
  };
}