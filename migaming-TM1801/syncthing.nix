{ config, lib, pkgs, ... }:
{
	services.syncthing = {
		user = "katsu-migaming";
		configDir = "/home/katsu/nixos-config/migaming-TM1801/syncthing";	
	};
}