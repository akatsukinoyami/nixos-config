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
	git push heroku master
	firebase deploy
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

function youtube --description '' --argument argv
	set command '
		echo Using link: '$argv'
		echo "DOWNLOADING VIDEO"
		youtube-dl  '$argv'
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