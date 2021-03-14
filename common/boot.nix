{ config, pkgs, ... }:

{ 
  boot.loader = {
		systemd-boot.enable = true;				#Use the systemd-boot EFI boot loader.
		efi.canTouchEfiVariables = true;
	};
}