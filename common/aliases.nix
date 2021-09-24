{ config, pkgs, ... }:

{
	environment.shellAliases = {
		pls			= "sudo";
		
		displaylink	= "cd ~/Downloads/ && nix-prefetch-url file://$PWD/displaylink.zip";
		tsu-boot	= "displaylink && sudo nixos-rebuild boot";
		tsu-switch	= "displaylink && sudo nixos-rebuild switch";
		tsu-clean	= "sudo nix-collect-garbage --delete-older-than 7d";
		tsu-push	= "cd ~/nixos-config && git add * && git commit -m 'one more commit' && git push -u origin master";

		ext-gpu		= "env DRI_PRIME=1";

		tg-nyan 	= "telegram-desktop -many -workdir ~/.telegram/nyawoobot";
		tg-it		= "telegram-desktop -many -workdir ~/.telegram/it";
		tg-lewd 	= "telegram-desktop -many -workdir ~/.telegram/lewd";
	};
}
