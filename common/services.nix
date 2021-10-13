{ config, pkgs, ... }:

{
  # List services that you want to enable:
  services = {
    xserver = {
      enable = true;       #Enable the X11 windowing system.
      displayManager = {
        gdm.enable = true;
        lightdm.enable = false;
      };
      desktopManager = {
        mate.enable = false;
        gnome.enable = true;
        plasma5.enable = false;
        pantheon.enable = false;
      };
      videoDrivers = ["displaylink" "modesetting"];
      layout = "us";
      libinput.enable = true;   	#Enable touchpad support (enabled default in most desktopManager).
    };
    sshd.enable = true;
    openssh.enable = true;  #Enable the OpenSSH daemon.
    printing = {       	    #Enable CUPS to print documents.
      enable = true;
      drivers = with pkgs; [ hplipWithPlugin ];
    };			
  };

  virtualisation.docker.enable = true;

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    channel = https://nixos.org/channels/nixos-unstable;
  };
}

