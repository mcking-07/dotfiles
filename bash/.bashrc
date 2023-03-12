# .bashrc by @mcking-07

# bashrc file
if [ -f ~/.bash/bashrc ]; then
  source ~/.bash/bashrc
fi

# abbreviation plugin
if [ -f ~/.bash/bash_abbreviations ]; then
  . ~/.bash/bash_abbreviations
fi

# alias definitions
if [ -f ~/.bash/bash_aliases ]; then
  . ~/.bash/bash_aliases
fi
