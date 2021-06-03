{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
	
	environment.systemPackages = with pkgs; [
			arandr
			audacity
			chromium
			discord
			docker-compose
			elisa
			evtest
			ffmpeg
			gparted
			fish
			jetbrains.jdk
			gitFull
			goldendict
			neofetch
			home-manager
			mtpfs
			nodejs
			ntfs3g
			openssh
			p7zip
			pcmanfm-qt
			ppsspp
			pulseaudioFull
			screenfetch
			sshfs
			tdesktop
			tilda
			tilix
			ktorrent
			vlc
			vscode
			wineFull
			wget
			wpsoffice
			];

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
#		sway = {
#			enable = true;
#			wrapperFeatures.gtk = true; # so that gtk works properly
#			extraPackages = with pkgs; [
#				swaylock
#				swayidle
#				wl-clipboard
#				mako # notification daemon
#				waybar
#				wofi 
#			];
#		};
#  		steam.enable = true;
#		git = {
#			enable = true;
#			userName  = "akatsukinoyami";
#			userEmail = "akatsukinoyami@yahoo.com";
#		};
  };

	nixpkgs.config = {
		allowUnfree = true;
# 		packageOverrides = pkgs: {
#			steam = pkgs.steam.override {
#				nativeOnly = true;
#   			};
#  		};
	};
}
