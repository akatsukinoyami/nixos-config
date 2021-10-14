{ config, pkgs, ... }:
{
	security.sudo.wheelNeedsPassword = false; 
	virtualisation.docker.enable = true;
}