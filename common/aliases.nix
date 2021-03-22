{ config, pkgs, ... }:

{
	environment.shellAliases = {
			pls						= "sudo";
			tsu-boot			= "sudo nixos-rebuild boot";
			tsu-garbage		= "nix-collect-garbage -d";
			tsu-switch		= "cd ~/Downloads/ && nix-prefetch-url file://$PWD/displaylink.zip && sudo nixos-rebuild switch";
			tsu-py				= "nix-shell -p 'python38.withPackages(ps: with ps; [ ])' && fish && clear";
			tsu-push			= "cd ~/nixos-config && git add * && git commit -m 'one more commit' && git push -u origin master";
			docker-switch = "docker-compose build && docker-compose up";
			ext-gpu				= "env DRI_PRIME=1";
			tg-nyan 			= "telegram-desktop -many -workdir ~/.telegram/nyawoobot";
			tg-mirai			= "telegram-desktop -many -workdir ~/.telegram/mirai";
			tg-it					= "telegram-desktop -many -workdir ~/.telegram/it";
			tg-lewd 			= "telegram-desktop -many -workdir ~/.telegram/lewd";
  	};
}
