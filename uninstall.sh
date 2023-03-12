# uninstall script for dotfiles by @mcking-07

DOT_CONFIG_FOLDERS='starship, nvim'
DOT_FOLDERS='bash'

for folder in $(echo $DOT_CONFIG_FOLDERS | sed "s/,/ /g"); do
  echo "[+] $folder"
  stow -v -t $HOME/.config/$folder $folder &>/dev/null
done

for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
  echo "[+] $folder"
  stow -t $HOME -D $folder &>/dev/null
done


