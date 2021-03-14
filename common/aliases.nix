{ config, pkgs, ... }:

{
	environment.shellAliases = {
			pls						= "sudo";
			tsu-boot			= "sudo nixos-rebuild boot";
			tsu-switch		= "sudo nixos-rebuild switch";
			tsu-garbage		= "nix-collect-garbage -d";
			tsu-py				= "nix-shell -p 'python38.withPackages(ps: with ps; [ ])' && fish && clear";
			tsu-push			= "cd ~/Documents/nixos/ && git add * && git commit -m 'one more commit' && git push -u origin master";
			docker-switch = "docker-compose build && docker-compose up";
			ext-gpu				= "env DRI_PRIME=1";
  	};
}