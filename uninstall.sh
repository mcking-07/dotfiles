# uninstall script for dotfiles by @mcking-07

# define the list of dotfile and config folders
DOT_CONFIG_FOLDERS='starship, nvim'
DOT_FOLDERS='bash, git'

# loop through dotconfig folders and remove symlinks
for folder in $(echo $DOT_CONFIG_FOLDERS | sed "s/,/ /g"); do
  echo "[+] $folder"
  stow -v -t $HOME/.config/$folder $folder &>/dev/null
done

# loop through dotfile folders and remove symlinks
for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
  echo "[+] $folder"
  stow -t $HOME -D $folder &>/dev/null
done
