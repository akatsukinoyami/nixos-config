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
			gparted
			fish
			gitFull
			goldendict
			neofetch
			home-manager
			mtpfs
			ntfs3g
			openssh
			pcmanfm-qt
			ppsspp
			pulseaudioFull
			screenfetch
			sshfs
			steam
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
		fish.enable = true;
		adb.enable = true;
	#	git = {
	#		enable = true;
	#   userName  = "akatsukinoyami";
	#   userEmail = "akatsukinoyami@yahoo.com";
	#	};
  };

	nixpkgs.config.allowUnfree = true;
}