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
			google-chrome

			discord
			tdesktop
			slack

			heroku
			nodePackages.firebase-tools
			ktorrent
			wget
			youtube-dl

            #MEDIA
			gthumb
			audacity
			rhythmbox
			ffmpeg
			vlc
			ppsspp
            
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
			winetricks
			wineWowPackages.stable

			#GTK
			arc-theme
			gnome-breeze
			materia-theme

			kde-gtk-config
			lxappearance

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