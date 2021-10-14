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

set python_libraries 'requests pyrogram tgcrypto discord flask youtube-dl'
function python
	nix-shell -p "python38.withPackages(ps: with ps; [ $python_libraries ])" --run fish
end

function python-run
	nix-shell -p "python38.withPackages(ps: with ps; [ $python_libraries ])" --run "python3 $argv"
end

function python-with
	nix-shell -p "python38.withPackages(ps: with ps; [ $argv ])"
end

function tsu-deploy
	git add * 
	git commit -m $argv
	git push origin master
	firebase deploy
end
function youtube
	set command '
		echo Using link: '$argv'
		echo "DOWNLOADING VIDEO"
		youtube-dl  '$argv'
		echo "DOWNLOADING FINISHED"
		'
	nix-shell -p python38.withPackages(ps: with ps; [ youtube-dl ]) --run $command
end
function youtube-mp3
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

function tsu-help
	set commands pls ext-gpu tsu-help tsu-boot tsu-switch tsu-push-config tsu-clean tsu-conf tsu-bots tsu-work python python-run python-with youtube youtube-mp3 youtube-both 
		set pls				'\033[37mAlias for sudo'
		set ext-gpu			'\033[37mAlias for executing application with nVidia GPU.'
		set tsu-help 		'\033[37mPrint this message'
		set tsu-boot 		'\033[32mAlias for nixos-rebuild with reboot'
		set tsu-switch 		'\033[32mAlias for nixos-rebuild without reboot and push config to github'
		set tsu-push-config	'\033[32mAlias for making commit of nixos-config and push to github'
		set tsu-clean 		'\033[32mAlias for clean nixos-collect-garbage older then 1 week'
		set tsu-conf 		'\033[36mAlias for open VSCode with nixos-config folder'
		set tsu-bots 		'\033[36mAlias for open VSCode with python-bots folder'
		set tsu-work 		'\033[36mAlias for open VSCode with work folder'
		set python 			'\033[33mAlias for open shell with python and pre-defined libraries'
		set python-run 		'\033[33mAlias for open specified script with python and pre-defined libraries'
		set python-with 	'\033[33mAlias for open shell with python and specified libraries'
		set youtube 		'\033[31mAlias for download video from youtube by specified link'
		set youtube-mp3		'\033[31mAlias for download audio from youtube by specified link'
		set youtube-both	'\033[31mAlias for download audio and video from youtube by specified link'
	
	for i in (seq (count $$commands))
		if $commands[$i] in $args
			echo -e $$commands[$i]
		end
	end
#	switch $argv
#		case 'pls'
#			echo -e '\033[37mAlias for sudo'
#		case 'ext-gpu'
#			echo -e '\033[37mAlias for executing application with nVidia GPU.'
#		case 'tsu-help'
#			echo -e '\033[37mPrint this message'
#		case 'tsu-boot'
#			echo -e '\033[32mAlias for nixos-rebuild with reboot'
#		case 'tsu-switch'
#			echo -e '\033[32mAlias for nixos-rebuild without reboot and push config to github'
#		case 'tsu-push-config'
#			echo -e '\033[32mAlias for making commit of nixos-config and push to github'
#		case 'tsu-clean'
#			echo -e '\033[32mAlias for clean nixos-collect-garbage'
#		case 'tsu-conf'
#			echo -e '\033[36mAlias for open VSCode with nixos-config folder'
#		case 'tsu-bots'
#			echo -e '\033[36mAlias for open VSCode with python-bots folder'
#		case 'tsu-work'
#			echo -e '\033[36mAlias for open VSCode with work folder'
#		case 'python'
#			echo -e '\033[33mAlias for open shell with python and pre-defined libraries'
#		case 'python-run'
#			echo -e '\033[33mAlias for open specified script with python and pre-defined libraries'
#		case 'python-with'
#			echo -e '\033[33mAlias for open shell with python and specified libraries'
#		case 'youtube'
#			echo -e '\033[31mAlias for download video from youtube by specified link'
#		case 'youtube-mp3'
#			echo -e '\033[31mAlias for download audio from youtube by specified link'
#		case 'youtube-both'
#			echo -e '\033[31mAlias for download audio and video from youtube by specified link'
#		case '*'
#			echo -e 'Aliases in system:\n
#  \033[37mpls, ext-gpu, tsu-help, \033[32mtsu-boot, tsu-switch, tsu-push-config, tsu-clean,
#  \033[36mtsu-conf, tsu-bots, tsu-work, \033[33mpython, python-run, python-with,
#  \033[31myoutube, youtube-mp3, youtube-both.
#\n\033[0mWrite tsu-help /some-alias/ for info about it.'
#	end
end

