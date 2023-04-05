# .bashrc by @mcking-07

# bashrc file
if [ -f ~/.bash/bashrc ]; then
  source ~/.bash/bashrc
fi

# abbreviation plugin
if [ -f ~/.bash/bash_abbreviations_plugin ]; then
  source ~/.bash/bash_abbreviations_plugin
fi

# alias definitions
if [ -f ~/.bash/bash_aliases ]; then
  source ~/.bash/bash_aliases
fi

# ssh definitions
if [ -f ~/.bash/ssh_aliases ]; then
  source ~/.bash/ssh_aliases
fi
