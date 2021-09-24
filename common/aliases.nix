{ config, pkgs, ... }:

{
	environment.shellAliases = {
		pls				= "sudo";

		displaylink		= "cd ~/Downloads/ && nix-prefetch-url file://$PWD/displaylink.zip";
		rebuild			= "displaylink && sudo nixos-rebuild";
		tsu-boot		= "rebuild boot --upgrade";
		tsu-switch		= "rebuild switch --upgrade && tsu-config-push";

		tsu-clean		= "sudo nix-collect-garbage --delete-older-than 7d";
		tsu-config-push	= "cd ~/nixos-config && tsu-commit 'one more commit' && git push -u origin master";

		tsu-commit		= "git add * && git commit -m ";
		tsu-deploy		= "git push origin master && git push heroku master && firebase deploy";

		ext-gpu			= "env DRI_PRIME=1";

		tg-nyan 		= "telegram-desktop -many -workdir ~/.telegram/nyawoobot";
		tg-it			= "telegram-desktop -many -workdir ~/.telegram/it";
		tg-lewd 		= "telegram-desktop -many -workdir ~/.telegram/lewd";

		nix-youtube 	= "nix-shell -p python38.withPackages(ps: with ps; [ youtube-dl ]) --run 'youtube-dl '";
		nix-youtube-mp3 = "nix-shell -p python38.withPackages(ps: with ps; [ youtube-dl ]) --run 'youtube-dl --extract-audio --audio-format mp3 '";

	};
}
