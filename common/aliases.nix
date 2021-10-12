{ config, pkgs, ... }:

{
	environment.shellAliases = {
		pls				= "sudo";

		displaylink		= "cd ~/Downloads/ && nix-prefetch-url file://$PWD/displaylink.zip";
		rebuild			= "displaylink && sudo nixos-rebuild";
		tsu-boot		= "rebuild boot --upgrade";
		tsu-switch		= "rebuild switch --upgrade && tsu-push-config";

		tsu-conf		= "code ~/nixos-config";
		tsu-clean		= "sudo nix-collect-garbage --delete-older-than 7d";
		tsu-push-config	= "cd ~/nixos-config && git add * && git commit -m 'one more commit' && git push -u origin master";

		ext-gpu			= "env DRI_PRIME=1";

		tg-news			= "telegram-desktop -many -workdir ~/.telegram/news";
		tg-game 		= "telegram-desktop -many -workdir ~/.telegram/game";

	};
}
