{ config, pkgs, ... }:

{
	hardware = {
		sane = {
			enable = true;
			extraBackends = [ pkgs.hplipWithPlugin ];
		};
#		pulseaudio = {
#			enable = true;
#			package = pkgs.pulseaudioFull;
#		};
#		bluetooth.enable = true;
	};

	sound = {
		enable = true;   # Enable sound.
		mediaKeys = {
			enable = true;
			volumeStep = "5%";
		};
	};
}