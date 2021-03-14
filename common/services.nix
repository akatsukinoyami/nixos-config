{ config, pkgs, ... }:

{
  # List services that you want to enable:
  services = {
		xserver = {
			enable = true;						#Enable the X11 windowing system.
			displayManager = {
				gdm.enable = true;
				lightdm.enable = false;
			};
			desktopManager = {
				gnome3.enable = true;
				mate.enable = false;
				pantheon.enable = false;
			};
			videoDrivers = ["displaylink" "modesetting"];
			layout = "us";
			libinput.enable = true;   #Enable touchpad support (enabled default in most desktopManager).
		};
		sshd.enable = true;
		openssh.enable = true;  		#Enable the OpenSSH daemon.
		printing.enable = true;   	#Enable CUPS to print documents.
  };

	virtualisation.docker.enable = true;
}