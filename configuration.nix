# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
	systemd-boot.enable = true;
	efi.canTouchEfiVariables = true;
	};
  
  fileSystems = {
	"/home/katsu/Files" = {
		device = "/dev/nvme0n1p1";
		fsType = "ntfs"; 
      		options = [ "rw" "uid=1000"];
	};
	"/home/katsu/Windows" = {
		device = "/dev/nvme1n1p4";	
		fsType = "ntfs"; 
		options = [ "rw" "uid=1000"];
	};
	"/home/katsu/HDD" = {
		device = "/dev/sda1";
		fsType = "ntfs"; 
      		options = [ "rw" "uid=1000"];
	};
} // (builtins.mapAttrs (name: value: { device = value; options = ["bind"]; }) {
	"/home/katsu/Documents" = "/home/katsu/Files/Development";
	"/home/katsu/Desktop" = "/home/katsu/Files/Desktop";
	"/home/katsu/Downloads" = "/home/katsu/Files/Downloads";
	"/home/katsu/Pictures" = "/home/katsu/HDD/Pictures";
	"/home/katsu/Music" = "/home/katsu/HDD/Music";
	"/home/katsu/Videos" = "/home/katsu/HDD/Videos";
});

  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  security.sudo.wheelNeedsPassword = false; 

  #Set your time zone.
  time.timeZone = "Europe/Kiev";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.

  networking = {
	hostName = "katsu-nixos";
	useDHCP = false;
  	interfaces = {
		enp8s0.useDHCP = true;
  		wlp0s20f3.useDHCP = true;
	};
 	networkmanager.enable = true;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services = {
	xserver = {
		enable = true;
		displayManager = {
			gdm.enable = false;
			lightdm.enable = true;
#			autoLogin = {
#				enable = true;
#				user = "katsu";
#			};
		};
		desktopManager = {
			gnome3.enable = false;
  			mate.enable = false;
  			pantheon.enable = true;
	 	};
#		videoDrivers = ["nvidia"];
		layout = "us";
	};
	sshd.enable = true; 
	printing.enable = true;   # Enable CUPS to print documents.
  };

  # Enable sound.
  sound.enable = true;
  hardware = {
	pulseaudio = {
   		enable = true;
    		extraModules = [ pkgs.pulseaudio-modules-bt ];
    		package = pkgs.pulseaudioFull;
  	};
	sane = {
		enable = true;
		extraBackends = [ pkgs.hplipWithPlugin ];
  	};
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  users.users.katsu = {
	isNormalUser = true;
	uid = 1000;
	hashedPassword = "$6$3KDmBJnJaypvGzJ$WzHALHk1BdDvOgmFR7/lJm6JLljRs1lMr6UBpmmh.sWSJM/VufMUUawBVGNrB8Dt60UkEQKkTHGOodaP3r7gL0";
	home = "/home/katsu";
	shell = pkgs.fish;
	description = "Katsu no Yami";
	extraGroups = ["wheel" "docker" "adbusers" "scanner" "lp"];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment = {
	systemPackages = with pkgs; [
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
  	shellAliases = {
		pls = "sudo";
		tsu-conf = "sudo nano -l /etc/nixos/configuration.nix";
		tsu-push = "cd ~/Documents/nixos/ && git add * && git commit -m 'one more commit' && git push -u origin master";
		tsu-switch = "sudo nixos-rebuild switch";
		tsu-boot = "sudo nixos-rebuild boot";
		tsu-py = "nix-shell -p 'python38.withPackages(ps: with ps; [ ])'
 && fish && clear";
		docker-switch = "docker-compose build && docker-compose up";
  	};
  };

  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;

  programs = {
	fish.enable = true;
	adb.enable = true;
#	git = {
#    		enable = true;
#    		userName  = "Akatsuki No Yami";
#    		userEmail = "hirokod3@gmail.com";
#  	};
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

