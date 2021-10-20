{ config, pkgs, ... }:
{
	environment = {
		shellAliases = {
			pls					= "sudo";
			ext-gpu				= "env DRI_PRIME=1";

			displaylink			= "cd ~/Downloads/ && nix-prefetch-url file://$PWD/displaylink.zip";
			rebuild-nixos		= "displaylink && sudo nixos-rebuild";
			boot-nixos			= "rebuild-nixos boot --upgrade && nixos-config-push";
			switch-nixos		= "rebuild-nixos switch --upgrade && nixos-config-push";
			switch-all			= "rebuild-nixos switch --upgrade && home-manager switch && nixos-config-push";
			switch-home			= "home-manager switch && nixos-config-push";

			nixos-config		= "code ~/nixos-config";
			code-bots			= "code ~/Documents/katsu_bots";
			code-work			= "code ~/Documents/Work";

			nixos-clean			= "sudo nix-collect-garbage --delete-older-than 7d";
			nixos-config-push	= "cd ~/nixos-config && git add * && git commit -m 'one more commit' && git push -u origin master";

			youtube-asmr		= "cd '/home/katsu/Music/asmr/' &&	youtube-mp3";
			youtube-ost			= "cd '/home/katsu/Music/OST Vocal/' && youtube-both";

			tg-news				= "telegram-desktop -many -workdir ~/.telegram/news";
			tg-game 			= "telegram-desktop -many -workdir ~/.telegram/game";
		};
	};
}
