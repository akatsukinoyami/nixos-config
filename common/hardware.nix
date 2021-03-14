{ config, pkgs, ... }:

{
  hardware = {
		pulseaudio = {
			enable = true;
			package = pkgs.pulseaudioFull;
		};
		bluetooth.enable = true;
		sane = {
			enable = true;
			extraBackends = [ pkgs.hplipWithPlugin ];
  	};
  };

  sound = {
		enable = true;   # Enable sound.
		mediaKeys = {
			enable = true;
			volumeStep = "5%";
		};
	};
}