{ config, pkgs, ... }:

{
	imports = [ 
			../config.nix
      ../hardware/migaming-TM1801.nix # Include the results of the hardware scan.
    ];

	fileSystems = {
	}
	// (builtins.mapAttrs (name: value: { device = value; fsType = "ntfs"; options = ["rw" "uid=1000"]; }) {
			"/home/katsu/Files" = "/dev/nvme0n1p1";
			"/home/katsu/Windows" = "/dev/nvme1n1p4";
			"/home/katsu/HDD" = "/dev/sda1";
	})
	// (builtins.mapAttrs (name: value: { device = value; options = ["bind"]; }) {
		"/home/katsu/Documents" = "/home/katsu/Files/Development";
		"/home/katsu/Desktop" = "/home/katsu/Files/Desktop";
		"/home/katsu/Downloads" = "/home/katsu/Files/Downloads";
		"/home/katsu/Pictures" = "/home/katsu/HDD/Pictures";
		"/home/katsu/Music" = "/home/katsu/HDD/Music";
		"/home/katsu/Videos" = "/home/katsu/HDD/Videos";
	});

	# The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.

  networking = {
		hostName = "katsu-migaming";
		interfaces = {
			enp8s0.useDHCP = true;
			wlp0s20f3.useDHCP = true;
		};
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}