{ config, pkgs, ... }:
{
	nixpkgs.config.allowUnfree = true;
	nix = {
		package = pkgs.nixUnstable;
		extraOptions = "experimental-features = flakes ca-references nix-command";
	};
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
	environment = {						# List packages installed in system profile. 
		systemPackages = with pkgs; [	# To search, run: $ nix search wget
			p7zip
			pcmanfm-qt
			softmaker-office
			sublime
			vscode

            #INTERNET
			firefox-wayland
			chromium
			google-chrome
			tor-browser-bundle-bin

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

			#SYSTEM AUDIO
			pulseeffects-legacy
			qpaeq

			#GNOME
			dconf2nix
			gnome-breeze
			gnome3.adwaita-icon-theme
			gnome3.dconf-editor
			gnome3.gnome-tweaks
			gnomeExtensions.appindicator

			#PANTHEON
			pantheon.elementary-camera

			#GTK
			adapta-gtk-theme
			arc-theme
			materia-theme

			vanilla-dmz
			capitaine-cursors
			
			kde-gtk-config
			lxappearance
			
			#XORG
			xorg.xinit
			xorg.xcursorthemes

            #FISH
			fish
			fishPlugins.fzf-fish
			fishPlugins.forgit

			#SWAY
			autotiling
			mako #notification daemon
			sway
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
}