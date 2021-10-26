{ config, lib, pkgs, ... }:

{
	boot = {
		initrd = {
			availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
			kernelModules = [ ];
		}; 
	};
}