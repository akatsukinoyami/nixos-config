{ config, pkgs, ... }:

{
# List packages installed in system profile. To search, run:
# $ nix search wget
	nix = {
    package = pkgs.nixUnstable;
    extraOptions = "experimental-features = flakes ca-references nix-command";
  };
	nixpkgs.config = {
		allowUnfree = true;
	};
	environment = {
		systemPackages = with pkgs; [
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
			neofetch
			home-manager
			mtpfs
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
	};
}