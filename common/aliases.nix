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
			
			python-before	= "nix-shell -p 'python38.withPackages(ps: with ps;";
			python-run		= "python-before [ discord flask pyrogram requests tgcrypto youtube-dl ])' --run";
			python			= "python-run python3";
			python-shell	= "python-run fish";

			youtube-shell	= "python-before [ youtube-dl ])' --run";
			youtube			= "youtube-shell 'youtube-dl '";
			youtube-mp3		= "youtube-shell 'youtube-dl --extract-audio --audio-format mp3 '";
			youtube-asmr	= "cd '/home/katsu/Music/asmr/' &&	youtube-mp3";
			youtube-ost		= "cd '/home/katsu/Music/OST Vocal/' && youtube-both";
			
			tg-news			= "telegram-desktop -many -workdir ~/.telegram/news";
			tg-game 		= "telegram-desktop -many -workdir ~/.telegram/game";
		};
	};
}
