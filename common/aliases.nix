{ config, pkgs, ... }:

{
	environment.shellAliases = {
		pls				= "sudo";

		displaylink		= "cd ~/Downloads/ && nix-prefetch-url file://$PWD/displaylink.zip";
		rebuild			= "displaylink && sudo nixos-rebuild";
		tsu-boot		= "rebuild boot --upgrade";
		tsu-switch		= "rebuild switch --upgrade && tsu-push-config";

		tsu-clean		= "sudo nix-collect-garbage --delete-older-than 7d";
		tsu-push-config	= "cd ~/nixos-config && git add * && git commit -m 'one more commit' && git push -u origin master";

		ext-gpu			= "env DRI_PRIME=1";

		tg-nyan 		= "telegram-desktop -many -workdir ~/.telegram/nyawoobot";
		tg-it			= "telegram-desktop -many -workdir ~/.telegram/it";
		tg-lewd 		= "telegram-desktop -many -workdir ~/.telegram/lewd";

		nix-youtube		= "nix-shell -p python38.withPackages(ps: with ps; [ youtube-dl ]) --run";
		youtube 		= "nix-youtube 'youtube-dl '";
		youtube-mp3 	= "nix-youtube 'youtube-dl --extract-audio --audio-format mp3 '";

	};
}
