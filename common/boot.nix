{ config, pkgs, modulesPath, ... }:
{ 
	imports = [(modulesPath + "/installer/scan/not-detected.nix")];

	boot = {
		kernelModules = [ "kvm-intel" ];
		extraModulePackages = [ ];
			loader = {
				systemd-boot.enable = true;				#Use the systemd-boot EFI boot loader.
				efi.canTouchEfiVariables = true;
			};
		};
}