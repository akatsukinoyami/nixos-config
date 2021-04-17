{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
	
  users.users.katsu = {
		uid = 1000;
		home = "/home/katsu";
		shell = pkgs.fish;
		isNormalUser = true;
		description = "Akatsuki no Yami";
		extraGroups = ["wheel" "audio" "docker" "adbusers" "scanner" "lp"];
		hashedPassword = "$6$3KDmBJnJaypvGzJ$WzHALHk1BdDvOgmFR7/lJm6JLljRs1lMr6UBpmmh.sWSJM/VufMUUawBVGNrB8Dt60UkEQKkTHGOodaP3r7gL0";
  };
}