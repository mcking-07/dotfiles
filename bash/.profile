# .profile by @mcking-07

# include .bashrc if exists
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

# bin path config
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# local bin path config
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

# brew path config
if command -v brew &>/dev/null; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# fzf paths and configs -- autocomplete, key-bindings and nord colors
if [ -d "$HOME/.config/fzf" ]; then
  if [[ ! "$PATH" == *$HOME/.config/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}$HOME/.config/fzf/bin"
  fi

  [[ $- == *i* ]] && source "$HOME/.config/fzf/shell/completion.bash" &>/dev/null
  source "$HOME/.config/fzf/shell/key-bindings.bash"

  source "$HOME/.config/fzf/shell/fzf-bash-completion.sh"
  bind -x '"\t": fzf_bash_completion'

  export FZF_DEFAULT_OPTS="--color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1 --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1 --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b"
fi

# nix path config
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# nvm path config -- autocomplete
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
fi

# start ssh-agent -- windows subsystem for linux
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent &>/dev/null)"
  export SSH_AUTH_SOCK="/tmp/ssh-agent-sock"
fi
