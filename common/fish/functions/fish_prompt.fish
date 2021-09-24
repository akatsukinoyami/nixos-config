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

function python --description 'start a nix-shell with the given python packages' --argument argv
	nix-shell -p "python38.withPackages(ps: with ps; [ $argv ])"
end

function youtube --description 'start a nix-shell with youtube-dl and downloads video and\or audio' --argument argv

	set link $argv[2]

	set python "python38.withPackages(ps: with ps; [ youtube-dl ])"
	switch $argv[1]
		case "video"
			nix-shell -p $python --run 'youtube-dl '$link
		case "audio"
			nix-shell -p $python --run 'youtube-dl --extract-audio --audio-format mp3 '$link
		case "both"
			echo "KATSU youtube: Downloading audio"
			nix-shell -p $python --run 'youtube-dl --extract-audio --audio-format mp3 '$link
			echo "KATSU youtube: Downloading video"
			nix-shell -p $python --run 'youtube-dl '$link
		case '*'
			nix-shell -p $python --run 'youtube-dl '$link
	end
end

function commit-and-push --description 'add files to commit, commiting and pushing to github, heroku, firebase' --argument argv
	git add *
	git commit -m "$argv"
	git push origin master
	git push heroku master
	firebase deploy
end