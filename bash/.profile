# .profile by @mcking-07

# include .bashrc if exists
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# bin path configs
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# local bin path configs
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

# brew path config
if command -v brew &>/dev/null; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# nix path config
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# nvm path config -- autocomplete
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# fzf paths and configs -- autocomplete and key bindings
if [ -d "$HOME/.config/fzf" ]; then
  if [[ ! "$PATH" == *$HOME/.config/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}$HOME/.config/fzf/bin"
  fi

  [[ $- == *i* ]] && source "$HOME/.config/fzf/shell/completion.bash" &>/dev/null
  source "$HOME/.config/fzf/shell/key-bindings.bash"
fi
