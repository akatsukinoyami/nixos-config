{ config, pkgs, ... }:

{
	environment.shellAliases = {
			pls				= "sudo";

			tsu-clean		= "sudo nix-collect-garbage -d";

			displaylink		= "cd ~/Downloads/ && nix-prefetch-url file://$PWD/displaylink.zip";
			
			tsu-boot		= "displaylink && sudo nixos-rebuild boot";
			tsu-switch		= "displaylink && sudo nixos-rebuild switch";

			tsu-push		= "cd ~/nixos-config && git add * && git commit -m 'one more commit' && git push -u origin master";

			docker-switch 	= "docker-compose build && docker-compose up";

			ext-gpu			= "env DRI_PRIME=1";

			tg				= "telegram-desktop -many -workdir";
			tg-nyan 		= "tg ~/.telegram/nyawoobot";
			tg-mirai		= "tg ~/.telegram/mirai";
			tg-it			= "tg ~/.telegram/it";
			tg-lewd 		= "tg ~/.telegram/lewd";
  	};
}
