# install script for dotfiles by @mcking-07

# define the list of dotfile and config folders
DOT_CONFIG_FOLDERS="starship, nvim"
DOT_FOLDERS="bash, git"

set -e
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
PRESENT=false

echo "[+] Dotfiles :: $SCRIPT_DIR"

# install stow if not already installed
if ! command -v stow &>/dev/null; then
  echo "[+] Installing stow..."
  sudo apt install -y stow
fi

# loop through dotconfig folders and create symlinks
for folder in $(echo $DOT_CONFIG_FOLDERS | sed "s/,/ /g"); do
  echo "[+] Creating symlinks for $folder"
  mkdir -p $HOME/.config/$folder

  stow -t $HOME/.config -D $folder &>/dev/null
  stow -v -t $HOME/.config/$folder $folder &>/dev/null
done

# loop through dotfile folders and create symlinks
for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
  echo "[+] Creating symlinks for $folder"

  stow -t $HOME -D $folder &>/dev/null
  stow -v -t $HOME $folder &>/dev/null
done

# look for DOT_FOLDER in the .env
while IFS= read -r var; do
  [[ $var =~ ^(DOT_FOLDER).* ]] && PRESENT=true
done <"$HOME/.env"

# If not present, write the DOT_FOLDER into the file
if [[ $PRESENT == "false" ]]; then
  echo "[+] Adding DOT_FOLDER to .env"
  echo "DOT_FOLDER=$SCRIPT_DIR" >>$HOME/.env
fi

# reload shell once installed
echo "[+] Dotfiles installation complete. Reloading shell..."
exec $SHELL -l
