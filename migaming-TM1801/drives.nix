{ config, lib, pkgs, ... }:
{
	swapDevices = [ ];
	
	fileSystems = { 
		"/" = { 
			device = "/dev/disk/by-uuid/7140cb4f-909d-4165-8152-77e2d2653e8a";
			fsType = "ext4";
		};
		"/boot" = { 
			device = "/dev/disk/by-uuid/DE80-8C0A";
			fsType = "vfat";
		};
	}
	// (builtins.mapAttrs (name: value: { device = value; fsType = "ntfs"; options = ["rw" "uid=1000"]; }) {
		"/home/katsu/Files"		= "/dev/nvme0n1p1";
		"/home/katsu/Windows" 	= "/dev/nvme1n1p4";
		"/home/katsu/HDD"		= "/dev/sda1";
	})
	// (builtins.mapAttrs (name: value: { device = value; options = ["bind"]; }) {
		"/home/katsu/Documents" = "/home/katsu/Files/Development";
		"/home/katsu/Desktop"	= "/home/katsu/Files/Desktop";
		"/home/katsu/Downloads"	= "/home/katsu/Files/Downloads";
		"/home/katsu/Pictures" 	= "/home/katsu/HDD/Pictures";
		"/home/katsu/Music"		= "/home/katsu/HDD/Music";
		"/home/katsu/Videos"	= "/home/katsu/HDD/Videos";
	});


	systemd.services.hd-idle = {
		description = "External HD spin down daemon";
		wantedBy = [ "multi-user.target" ];
		serviceConfig = {
			Type = "forking";
			ExecStart = "${pkgs.hd-idle}/bin/hd-idle -i 0 -a sda -i 600";
		};
	};
}