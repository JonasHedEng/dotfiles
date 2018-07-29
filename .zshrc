autoload -Uz promptinit
autoload -Uz compinit
autoload -U colors zsh/terminfo

# Completions
fpath+=~/.config/zfunc

promptinit
compinit
colors

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
HIST_STAMPS="yyyy-mm-dd"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt histignorespace
bindkey -v
bindkey -M viins 'ht' vi-cmd-mode

setprompt() {
  setopt prompt_subst

  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
    p_host='%F{yellow}%M%f'
  else
    p_host='%F{green}%M%f'
  fi

  PS1=${(j::Q)${(Z:Cn:):-$'
    ${p_host}
    %F{cyan}:%f
    %F{blue}%(3~|%-1~/../%2~|%~)%f
    %(!.%F{red}%#%f.%F{green} λ%f)
    " "
  '}}

  PS2=$'λ '
}
setprompt

function preexec() {
  timer=$(($(date +%s%N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%N)/1000000))
    elapsed=$(($now-$timer))

    export RPROMPT="%F{cyan}$(tf ${elapsed})%{$reset_color%}"
    unset timer
  fi
}

export GOPATH=/home/bman/.local/go
export PATH=$GOPATH/bin:/home/bman/.cargo/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH

alias ed='vim $(fzf);'
alias ls='exa -F'
alias doc='docker-compose'

export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/vim
export GPG_TTY=$(tty)

