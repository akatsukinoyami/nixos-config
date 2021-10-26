{ config, lib, pkgs, ... }:
{
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
