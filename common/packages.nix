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
			arandr
			audacity
			chromium
			discord
			docker-compose
			elisa
			evtest
			ffmpeg
			google-chrome
			gparted
			fish
			fishPlugins.fzf-fish
			fishPlugins.forgit
			jetbrains.jdk
			gitFull
			goldendict
			neofetch
			heroku
			home-manager
			mtpfs
			nodejs
			nodePackages.firebase-tools
			ntfs3g
			openssh
			p7zip
			pcmanfm-qt
			ppsspp
			pulseaudioFull
			rhythmbox
			slack
			screenfetch
			softmaker-office
			sshfs
			steam-run-native
			sublime
			tdesktop
			tilda
			tilix
			gthumb
			ktorrent
			vlc
			vscode
			wineWowPackages.stable
			wget
			youtube-dl
			
			# For wayland
			autotiling
			mako # notification daemon
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
		fish.enable = true;
		light.enable = true;
	};
}
