{ config, pkgs, ... }:
{
	environment = {
		shellAliases = {
			pls					= "sudo";
			ext-gpu				= "env DRI_PRIME=1";

			displaylink			= "cd ~/Downloads/ && nix-prefetch-url file://$PWD/displaylink.zip";
			boot-nixos			= "displaylink && sudo nixos-rebuild boot --upgrade && tsu-push-conf";
			switch-nixos		= "displaylink && sudo nixos-rebuild switch --upgrade && tsu-push-conf";
			switch-all			= "displaylink && sudo nixos-rebuild switch --upgrade && home-manager switch && tsu-push-conf";
			switch-home			= "home-manager switch && tsu-push-conf";

			nixos-config		= "code ~/nixos-config";
			code-bots			= "code ~/Documents/katsu_bots";
			code-work			= "code ~/Documents/Work";

			nixos-clean			= "sudo nix-collect-garbage --delete-older-than 7d";
			nixos-config-push	= "cd ~/nixos-config && git add * && git commit -m 'one more commit' && git push -u origin master";
			
			python-run			= "python-with discord flask pyrogram requests tgcrypto youtube-dl";
			python				= "python-run python3";
			python-shell		= "python-run fish";

			youtube-shell		= "python-with youtube-dl";
			youtube				= "youtube-shell 'youtube-dl '";
			youtube-mp3			= "youtube-shell 'youtube-dl --extract-audio --audio-format mp3 '";
			youtube-asmr		= "cd '/home/katsu/Music/asmr/' &&	youtube-mp3";
			youtube-ost			= "cd '/home/katsu/Music/OST Vocal/' && youtube-both";

			tg-news				= "telegram-desktop -many -workdir ~/.telegram/news";
			tg-game 			= "telegram-desktop -many -workdir ~/.telegram/game";
		};
	};
}
