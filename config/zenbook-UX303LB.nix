{ config, pkgs, ... }:

{
	imports = [ 
		../config.nix
        ../hardware/zenbook-UX303LB.nix # Include the results of the hardware scan.
    ];

	nix.nixPath = [
		"nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
		"nixos-config=/home/katsu/Documents/nixos/config/migaming-TM1801.nix"
		"/nix/var/nix/profiles/per-user/root/channels"
	];

	fileSystems = {
	}
	// (builtins.mapAttrs (name: value: { device = value; fsType = "ntfs"; options = ["rw" "uid=1000"]; }) {
		"/home/katsu/Files"     = "/dev/sdb6";
		"/home/katsu/Windows"   = "/dev/sdb4";
		"/home/katsu/HDD"       = "/dev/sda2";
	})
	// (builtins.mapAttrs (name: value: { device = value; options = ["bind"]; }) {
		"/home/katsu/Desktop"   = "/home/katsu/Files/Desktop";
		"/home/katsu/Downloads" = "/home/katsu/Files/Downloads";
		"/home/katsu/Pictures"  = "/home/katsu/Files/Pictures";
		"/home/katsu/Music"     = "/home/katsu/Files/Music";
		"/home/katsu/Videos"    = "/home/katsu/Files/Videos";
	});

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