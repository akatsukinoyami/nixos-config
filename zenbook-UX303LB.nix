{ config, lib, pkgs, ... }:

{
	imports = [./config.nix];

  boot.initrd = {
		availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
		kernelModules = [ ];
	};

  swapDevices = [ { device = "/dev/disk/by-uuid/60d3da8a-1f53-4cfb-a73f-4861be804931"; } ];

	fileSystems = {
		"/" = { 
      device = "/dev/disk/by-uuid/45374fe2-5c93-41d3-aede-1444446eec11";
      fsType = "ext4";
    };
  	"/boot" = { 
      device = "/dev/disk/by-uuid/04A4-E15B";
      fsType = "vfat";
    };
	}
	// (builtins.mapAttrs (name: value: { device = value; fsType = "ntfs"; options = ["rw" "uid=1000"]; }) {
		"/home/katsu/Files"     = "/dev/sdb6";
		"/home/katsu/Windows"   = "/dev/sdb4";
		"/home/katsu/Documents" = "/dev/sda2";
	})
	// (builtins.mapAttrs (name: value: { device = value; options = ["bind"]; }) {
		"/home/katsu/Desktop"   = "/home/katsu/Files/Desktop";
		"/home/katsu/Downloads" = "/home/katsu/Files/Downloads";
		"/home/katsu/Pictures"  = "/home/katsu/Files/Pictures";
		"/home/katsu/Music"     = "/home/katsu/Files/Music";
		"/home/katsu/Videos"    = "/home/katsu/Files/Videos";
	});

	nix.nixPath = [
		"nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
		"nixos-config=/home/katsu/nixos-config/zenbook-UX303LB.nix"
		"/nix/var/nix/profiles/per-user/root/channels"
	];

	# The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.

  networking = {
		hostName = "katsu-zenbook";
  	    interfaces = {
            enp0s20u2.useDHCP = true;
            wlp2s0.useDHCP = true;
		};
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}