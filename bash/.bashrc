#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ]; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ]; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ]; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100 # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ]; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >&/dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ]; then
        for file in "$@"; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >&/dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################
eval "$(starship init bash)"

eval "$(fzf --bash)"
# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
    cd) fzf --preview 'tree -C {} | head -200' "$@" ;;
    export | unset) fzf --preview "eval 'echo \$'{}" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    *) fzf --preview 'bat -n --color=always {}' "$@" ;;
    esac
}

alias fcheckout='git branch | awk '\''{$1=$1; print}'\'' | fzf --height=80% --layout=reverse --info=inline --border --margin=1 --padding=1 --preview '\''echo "Branch: {}"; echo "Latest Commit: $(git log --oneline -n 1 {})"'\'' | awk '\''{print $NF}'\'' | xargs git checkout'

export PICO_SDK_PATH=/home/jfujitani/repos/pico/pico-sdk
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.config/cache"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"

if [ -f ~/.bashrc_alias ]; then
    source ~/.bashrc_alias
fi

# Source Gemini API key if it exists
if [ -f ~/.config/gemini/api_key ]; then
  source ~/.config/gemini/api_key
fi

if [ -f /usr/bin/zoxide ]; then
  eval "$(zoxide init bash)"
fi

# Kitty Shell Integration                                                                                   │
# [ -f ~/.config/kitty/shell-integration/bash/kitty.bash ] && source ~/.config/kitty/shell-integration/bash/kitty.bash
