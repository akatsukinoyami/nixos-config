{ config, pkgs, ... }:

{
	time.timeZone = "Europe/Kiev";		  #Set your time zone.

  i18n.defaultLocale = "ru_RU.UTF-8"; # Select internationalisation properties.

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}