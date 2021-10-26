{ config, lib, pkgs, ... }:
{
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
