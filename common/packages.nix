{ config, pkgs, ... }:
{
	nix = {
		package = pkgs.nixUnstable;
		extraOptions = "experimental-features = flakes ca-references nix-command";
	};
	nixpkgs.config.allowUnfree = true;
	
	environment = {						# List packages installed in system profile. To search, run:
		systemPackages = with pkgs; [	# $ nix search wget
			p7zip
			pcmanfm-qt
			softmaker-office
			sublime
			vscode

            #INTERNET
			chromium
			discord
			google-chrome
			heroku
			nodePackages.firebase-tools
			ktorrent
			slack
			tdesktop
			wget
			youtube-dl
            #MEDIA
			audacity
			ffmpeg
			gthumb
			ppsspp
			rhythmbox
			vlc
            
			#SYSTEM
			arandr
			docker-compose
			elisa
			evtest
			gitFull
			gnome3.gnome-tweaks
			gnomeExtensions.appindicator
			gparted
			jetbrains.jdk
			lxappearance
			home-manager
			mtpfs
			neofetch
			nodejs
			ntfs3g
			openssh
			pulseaudioFull
			screenfetch
			sshfs
			steam-run-native
			tilda
			tilix
			wineWowPackages.stable

            #FISH
			fish
			fishPlugins.fzf-fish
			fishPlugins.forgit

			#SWAY
			autotiling
			mako #notification daemon
			swayidle
			swaylock
			waybar
			wl-clipboard
			wofi 
		];
	};

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

	programs = {
		adb.enable = true;
		dconf.enable = true;
		fish.enable = true;
		light.enable = true;
		gnupg.agent = {
			enable = true;
			enableSSHSupport = true;
		};
	};
}