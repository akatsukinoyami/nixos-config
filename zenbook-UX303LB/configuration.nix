{ config, lib, pkgs, ... }:

{
	imports = [
		./boot.nix
		./drives.nix
		./networking.nix
		./syncthing.nix
		../common/config.nix
		];
	
	nix = {
		nixPath = [
			"nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
			"nixos-config=/home/katsu/nixos-config/zenbook-UX303LB/configuration.nix"
			"/nix/var/nix/profiles/per-user/root/channels"
		];
	}; 
}