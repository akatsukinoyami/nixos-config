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
        picture-options = "zoom";
        picture-uri = "/home/katsu/nixos-config/common/background.jpg";
      };
      "org/gnome/gnome-session" = {
        logout-prompt = false;
      };
      "org/gnome/desktop/calendar" = {
        show-weekdate = true;
      };
      "/org/gnome/desktop/interface/" = {
        clock-format = "24h";
        gtk-theme = "Adwaita-dark";
        show-battery-percentage = true;
      };
      "/org/gnome/desktop/peripherals/touchpad/" = {
        natural-scroll = true;
      };
      "org/gnome/desktop/wm/keybindings" = {
        close = ["<Shift><Alt>q"];
        move-to-workspace-1 = ["<Shift><Alt>exclam"];
        move-to-workspace-2 = ["<Shift><Alt>at"];
        move-to-workspace-3 = ["<Shift><Alt>numbersign"];
        move-to-workspace-4 = ["<Shift><Alt>dollar"];
        #move-to-workspace-5 = ["<Shift><Alt>percent"];
        #move-to-workspace-6 = ["<Shift><Alt>:"];
        #move-to-workspace-7 = ["<Shift><Alt>?"];
        #move-to-workspace-8 = ["<Shift><Alt>"];
        #move-to-workspace-9 = ["<Shift><Alt>"];
        move-to-workspace-left = ["<Alt>Left"];
        move-to-workspace-right = ["<Alt>Right"];
        
        switch-to-workspace-1 = ["<Alt>1"];
        switch-to-workspace-2 = ["<Alt>2"];
        switch-to-workspace-3 = ["<Alt>3"];
        switch-to-workspace-4 = ["<Alt>4"];
        switch-to-workspace-5 = ["<Alt>5"];
        switch-to-workspace-6 = ["<Alt>6"];
        switch-to-workspace-7 = ["<Alt>7"];
        switch-to-workspace-8 = ["<Alt>8"];
        switch-to-workspace-9 = ["<Alt>9"];
      };
      "/org/gnome/desktop/wm/preferences/" = {
        button-layout = "appmenu:minimize,maximize,close";
        num-workspaces = 9;
      }; 
      "org/gnome/mutter" = {
        dynamic-workspaces = true;
        workspaces-only-on-primary = true;
      };
      "/org/gnome/shell" = {
        favorite-apps = [
          "chromium-browser.desktop" 
          "google-chrome.desktop" 
          "firefox.desktop" 
          "code.desktop" 
          "telegramdesktop.desktop" 
          "discord.desktop" 
          "slack.desktop" 
          "org.gnome.Screenshot.desktop" 
          "org.gnome.Nautilus.desktop"
        ];
      };
    };
  };
}