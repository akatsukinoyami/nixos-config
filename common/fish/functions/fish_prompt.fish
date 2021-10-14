function fish_prompt --description 'Informative prompt'
	#Save the return status of the previous command
	set -l last_pipestatus $pipestatus

	switch "$USER"
		case root toor
			printf '%s@%s %s%s%s# ' $USER (prompt_hostname) (set -q fish_color_cwd_root
															and set_color $fish_color_cwd_root
															or set_color $fish_color_cwd) \
				(prompt_pwd) (set_color normal)
		case '*'
			set -l pipestatus_string (__fish_print_pipestatus "[" "] " "|" (set_color $fish_color_status) \
									(set_color --bold $fish_color_status) $last_pipestatus)

			printf '[%s] %s%s@%s %s%s %s%s%s \f\r> ' (date "+%H:%M:%S") (set_color brblue) \
				$USER (prompt_hostname) (set_color $fish_color_cwd) $PWD $pipestatus_string \
				(set_color normal)
	end
end

function nix-python --description 'start a nix-shell with the given python packages' --argument argv
	nix-shell -p "python38.withPackages(ps: with ps; [ $argv ])"
end

function tsu-deploy --description 'deploy to all workspaces' --argument argv
	git add * 
	git commit -m $argv
	git push origin master
	firebase deploy
end
function youtube --description '' --argument argv
	set command '
		echo Using link: '$argv'
		echo "DOWNLOADING VIDEO"
		youtube-dl  '$argv'
		echo "DOWNLOADING FINISHED"
		'
	nix-shell -p python38.withPackages(ps: with ps; [ youtube-dl ]) --run $command
end
function youtube-mp3 --description '' --argument argv
	set command '
		echo Using link: '$argv'
		echo "DOWNLOADING AUDIO"
		youtube-dl --extract-audio --audio-format mp3 '$argv'
		echo "DOWNLOADING FINISHED"
		'
	nix-shell -p python38.withPackages(ps: with ps; [ youtube-dl ]) --run $command
end
function youtube-both --description '' --argument argv
	set command '
		echo Using link: '$argv'
		echo "DOWNLOADING AUDIO"
		youtube-dl --extract-audio --audio-format mp3 '$argv'
		echo "DOWNLOADING VIDEO"
		youtube-dl  '$argv'
		echo "DOWNLOADING FINISHED"
		'
	nix-shell -p python38.withPackages(ps: with ps; [ youtube-dl ]) --run $command
end

function tsu-help --description 'post help message' -argument argv
	switch $argv
		case 'pls'
			echo 'Alias for sudo'
		case 'ext-gpu'
			echo 'Alias for executing application with nVidia GPU.'
		case 'tsu-boot'
			echo 'Alias for nixos-rebuild with reboot'
		case 'tsu-switch'
			echo 'Alias for nixos-rebuild without reboot and push config to github'
		case 'tsu-push-config'
			echo 'Alias for making commit of nixos-config and push to github'
		case 'tsu-clean'
			echo 'Alias for clean nixos-collect-garbage'
		case 'tsu-conf'
			echo 'Alias for open VSCode with nixos-config folder'
		case 'tsu-bots'
			echo 'Alias for open VSCode with python-bots folder'
		case 'tsu-work'
			echo 'Alias for open VSCode with work folder'
    case 'tsu-help'
      echo 'Print this message'
    case '*'
      echo '''Aliases in system: 

  pls, ext-gpu, tsu-boot, tsu-switch, tsu-push-config, tsu-clean, 
  tsu-conf, tsu-bots, tsu-work, tsu-help
  
Write tsu-help /some-alias/ for info about it.'''
  end
end

