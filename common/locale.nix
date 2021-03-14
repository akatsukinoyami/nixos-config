{ config, pkgs, ... }:

{
	time = {
		timeZone = "Europe/Kiev";		#Set your time zone.
	};
	
	# Select internationalisation properties.
  i18n = {
		defaultLocale = "ru_RU.UTF-8";		
	};

  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  };
}