function tsu-deploy
	git add * 
	git commit -m $argv
	git push origin master
	firebase deploy
end

function python-with
	python-before "[ $argv ] ]) --run 'fish'"
end

function youtube-both
	youtube-mp3 $argv
	youtube $argv
end

set python_libraries 'discord flask pyrogram requests tgcrypto youtube-dl'

function tsu-help
	switch $argv
		case 'pls'
			set q '\033[37mAlias for sudo'
		case 'ext-gpu'
			set q '\033[37mAlias for executing application with nVidia GPU.'
		case 'tsu-help'
			set q '\033[37mPrint this message'
		case 'tsu-nix-boot'
			set q '\033[32mAlias for nixos-rebuild with reboot'
		case 'tsu-all-switch'
			set q '\033[32mAlias for nixos-rebuild w/o reboot and home-manager switch and push config to github'
		case 'tsu-nix-switch'
			set q '\033[32mAlias for nixos-rebuild w/o reboot and push config to github'
		case 'tsu-hom-switch'
			set q '\033[32mAlias for home-manager switch and push config to github'
		case 'tsu-clean'
			set q '\033[32mAlias for clean nixos-collect-garbage'
		case 'tsu-push-conf'
			set q '\033[32mAlias for making commit of nixos-config and push to github'
		case 'tsu-conf'
			set q '\033[36mAlias for open VSCode with nixos-config folder'
		case 'tsu-bots'
			set q '\033[36mAlias for open VSCode with python-bots folder'
		case 'tsu-work'
			set q '\033[36mAlias for open VSCode with work folder'
		case 'python-shell'
			set q '\033[33mAlias for open shell with python and pre-defined libraries\nWrite tsu-help python-libraries to print pre-defined libraries.'
		case 'python'
			set q '\033[33mAlias for open (if) specified script with python and pre-defined libraries (else) python interpreter.\nWrite tsu-help python-libraries to print pre-defined libraries.'
		case 'python-with'
			set q '\033[33mAlias for open shell with python and specified libraries'
		case 'python-libraries'
			set q "\033[33mPre-defined libraries for python: $python_libraries"
		case 'youtube'
			set q '\033[31mAlias for download video from youtube by specified link'
		case 'youtube-mp3'
			set q '\033[31mAlias for download audio from youtube by specified link'
		case 'youtube-both'
			set q '\033[31mAlias for download audio and video from youtube by specified link'
		case 'youtube-asmr'
			set q '\033[31mAlias for change directory to Music/ASMR and download audio from youtube by specified link'
		case 'youtube-ost'
			set q '\033[31mAlias for change directory to Music/OST and download audio and video from youtube by specified link'
		case '*'
			set q 'Aliases in system:\n
  \033[32mFor NixOS: tsu-nix-switch, tsu-all-switch, tsu-hom-switch, tsu-clean, tsu-push-conf;
  \033[36mFor VSCode: tsu-conf, tsu-bots, tsu-work;
  \033[33mFor Python: python, python-run, python-shell;
  \033[31mFor youtube-dl: youtube, youtube-mp3, youtube-both, youtube-asmr, youtube-ost;
  \033[37mOther: pls, ext-gpu, tsu-help.
\n\033[0mWrite tsu-help /some-alias/ for info about it.'
	end
	echo -e $q
end

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