{ config, lib, pkgs, ... }:

{
	boot = {
		initrd = {
			availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
			kernelModules = [ ];
		};
	};
}