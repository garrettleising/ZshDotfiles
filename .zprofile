#----------------------------------------Commands to Run-----------------------------------------
neofetch
#----------------------------------------ALiases-------------------------------------------------
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

alias update="sudo apt update && sudo apt upgrade"

alias ma="vim ~/.profile.sh"

alias switchToBash="chsh -s $(which bash)"

alias rconnection="nmcli radio wifi off && nmcli radio wifi on"

# Directory Changes
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias home="cd ~/"
alias osp="cd ~/OpenSourceProjects && ls -AlF"

alias st="exec zsh" # st = source terminal

# Silly / Just for fun
alias hypetrain="sl"
alias afk="cmatrix -s -b"
alias randoWal="wpg -m"

alias keybr="xdg-open https://www.keybr.com"

alias r=ranger-cd

#----------------------------------------Functions-------------------------------------------------

function ranger-cd {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

function ZshGithub {
	cp ~/.zshrc ~/OpenSourceProjects/CustomZshProfile
	cp ~/.zprofile ~/OpenSourceProjects/CustomZshProfile
	cp -r ~/.oh-my-zsh/custom ~/OpenSourceProjects/CustomZshProfile/
	cd ~/OpenSourceProjects/CustomZshProfile
	git add -A
	echo -n "Commit message: " 
	read response
	echo -n $response > commitMessage.txt
	git commit -F commitMessage.txt
	rm -f commitMessage.txt
	git push
}

#Find and open file
function faof {
	local path_variable=$(fzf --height 60% --reverse)
	xdg-open $path_variable
	cd $(dirname $path_variable)
}

#Script to remove duplicate files or photos
function removeDuplicates() {
	for d in ./*/; do (cd "$d" && rm *\(1\)*); done
}

#Change photos from HEIC to JPG in directory
funtion convertHeic() {
for f in *.HEIC; do (heif-convert $f $(basename $f .HEIC)"(converted)".jpg && rm $f); done
}

#Change photos from HEIC to JPG in subdirectories
function convertSubHeic() {
	for d in ./*/; do (cd "$d" && convertHeic); done
}