function tsu-deploy
	git add * 
	git commit -m $argv
	git push origin master
	firebase deploy
end

function python				
	nix-shell -p "python39.withPackages(ps: with ps; [ discord flask pyrogram requests tgcrypto youtube-dl pysdl2 pygame ])" --run "python3 $argv";
end
function python-shell		
	nix-shell -p "python39.withPackages(ps: with ps; [ discord flask pyrogram requests tgcrypto youtube-dl pysdl2 pygame ])" --run 'fish';
end
function python-with
	nix-shell -p "python39.withPackages(ps: with ps; [ $argv ])" --run 'fish'
end

function youtube
	nix-shell -p "python39.withPackages(ps: with ps; [ youtube-dl ])" --run "youtube-dl '$argv'"
end
function youtube-mp3
	nix-shell -p "python39.withPackages(ps: with ps; [ youtube-dl ])" --run "youtube-dl --extract-audio --audio-format mp3 '$argv'"
end
function youtube-both
	youtube-mp3 $argv
	youtube $argv
end

set python_libraries 'discord flask pyrogram requests tgcrypto youtube-dl'

function alias-help
	switch $argv
		case 'pls'
			set q '\033[37mAlias for sudo.'
		case 'ext-gpu'
			set q '\033[37mAlias for executing application with nVidia GPU.'
		case 'alias-help'
			set q '\033[37mPrint this message.'
		case 'boot-nixos'
			set q '\033[32mAlias for nixos-rebuild with reboot.'
		case 'switch-all'
			set q '\033[32mAlias for nixos-rebuild w/o reboot and home-manager switch and push config to github.'
		case 'switch-nixos'
			set q '\033[32mAlias for nixos-rebuild w/o reboot and push config to github.'
		case 'switch-home'
			set q '\033[32mAlias for home-manager switch and push config to github.'
		case 'nixos-clean'
			set q '\033[32mAlias for clean nixos-collect-garbage.'
		case 'nixos-config-push'
			set q '\033[32mAlias for making commit of nixos-config and push to github.'
		case 'nixos-config'
			set q '\033[36mAlias for open VSCode with nixos-config folder.'
		case 'code-bots'
			set q '\033[36mAlias for open VSCode with python-bots folder.'
		case 'code-work'
			set q '\033[36mAlias for open VSCode with work folder.'
		case 'python-shell'
			set q '\033[33mAlias for open shell with python and pre-defined libraries\nWrite tsu-help python-libraries to print pre-defined libraries..'
		case 'python'
			set q '\033[33mAlias for open (if) specified script with python and pre-defined libraries (else) python interpreter.\nWrite tsu-help python-libraries to print pre-defined libraries.'
		case 'python-libraries'
			set q "\033[33mPre-defined libraries for python: $python_libraries."
		case 'youtube'
			set q '\033[31mAlias for download video from youtube by specified link.'
		case 'youtube-mp3'
			set q '\033[31mAlias for download audio from youtube by specified link.'
		case 'youtube-both'
			set q '\033[31mAlias for download audio and video from youtube by specified link.'
		case 'youtube-asmr'
			set q '\033[31mAlias for change directory to Music/ASMR and download audio from youtube by specified link.'
		case 'youtube-ost'
			set q '\033[31mAlias for change directory to Music/OST and download audio and video from youtube by specified link.'
		case '*'
			set q 'Aliases in system:\n
  \033[32mFor NixOS: boot-nixos, switch-nixos, switch-all, switch-home, nixos-clean, nixos-config-push;
  \033[36mFor VSCode: nixos-config, code-bots, code-work;
  \033[33mFor Python: python, python-run, python-shell;
  \033[31mFor youtube-dl: youtube, youtube-mp3, youtube-both, youtube-asmr, youtube-ost;
  \033[37mOther: pls, ext-gpu, tsu-help.
\n\033[0mWrite alias-help /some-alias/ for info about it.'
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