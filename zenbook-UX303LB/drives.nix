{ config, lib, pkgs, ... }:
{
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

}