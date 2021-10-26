{ config, pkgs, ... }:

{
  # List services that you want to enable:
  services = {
    sshd.enable = true;
    openssh.enable = true;  #Enable the OpenSSH daemon.
    printing = {       	    #Enable CUPS to print documents.
      enable = true;
      drivers = with pkgs; [ hplipWithPlugin ];
    };	
    udev = {
      packages = with pkgs; [
        gnome3.gnome-settings-daemon
      ];
    };
    xserver = {
      enable = true;       #Enable the X11 windowing system.
      displayManager = {
        lightdm.enable = false;
        gdm.enable = true;
      };
      desktopManager = {
        mate.enable = false;
        plasma5.enable = false;
        pantheon.enable = false;
        gnome = {
          enable = true;
          extraGSettingsOverrides = "
            [org.gnome.desktop.interface]
            gtk-theme='Arc-Dark'
          ";
        };
      };
      videoDrivers = ["displaylink" "modesetting"];
      layout = "us";
      libinput.enable = true;   	#Enable touchpad support (enabled default in most desktopManager).
    };
    syncthing = {
      enable = true;
      user = "katsu-migaming";
      dataDir = "/home/katsu/";
      configDir = "/home/katsu/nixos-config/sycthing";
    };		
  };
}

