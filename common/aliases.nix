{ config, pkgs, ... }:
{
	environment = {
		shellAliases = {
			pls				= "sudo";
			ext-gpu			= "env DRI_PRIME=1";

			displaylink		= "cd ~/Downloads/ && nix-prefetch-url file://$PWD/displaylink.zip";
			tsu-nix-boot	= "displaylink && sudo nixos-rebuild boot --upgrade && tsu-push-conf";
			tsu-nix-switch	= "displaylink && sudo nixos-rebuild switch --upgrade && tsu-push-conf";
			tsu-all-switch	= "displaylink && sudo nixos-rebuild switch --upgrade && home-manager switch && tsu-push-conf";
			tsu-hom-switch	= "home-manager switch && tsu-push-conf";

			tsu-conf		= "code ~/nixos-config";
			tsu-bots		= "code ~/Documents/katsu_bots";
			tsu-work		= "code ~/Documents/Work";

			tsu-clean		= "sudo nix-collect-garbage --delete-older-than 7d";
			tsu-push-conf	= "cd ~/nixos-config && git add * && git commit -m 'one more commit' && git push -u origin master";

			tg-news			= "telegram-desktop -many -workdir ~/.telegram/news";
			tg-game 		= "telegram-desktop -many -workdir ~/.telegram/game";
		};
	};
}
