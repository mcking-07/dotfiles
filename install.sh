# install script for dotfiles by @mcking-07

# define the list of dotfile and config folders
DOT_FOLDERS=""
DOT_CONFIG_FOLDERS=""

# check if root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

set -e
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
PRESENT=false

echo "[+] Dotfiles :: $SCRIPT_DIR"

if ! command -v stow &>/dev/null; then
  sudo apt install -y stow
fi

# loop through dotfile folders and create symlinks
for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
  echo "[+] Folder :: $folder"

  stow -t $HOME -D $folder \
    --ignore=README.md --ignore=LICENSE
  stow -v -t $HOME $folder
done

# loop through config folders and create symlinks
for folder in $(echo $DOT_CONFIG_FOLDERS | sed "s/,/ /g"); do
  echo "[+] Folder :: $folder"

  stow -t $HOME/.config -D $folder \
    --ignore=README.md --ignore=LICENSE
  stow -v -t $HOME/.config $folder
done

# look for DOT_FOLDER or DOT_CONFIG_FOLDER in the .env
while IFS= read -r var; do
  [[ $var =~ ^(DOT_FOLDER|DOT_CONFIG_FOLDER).* ]] && PRESENT=true
done <"$HOME/.env"

# If not present, write the DOT_FOLDER or DOT_CONFIG_FOLDER var into the file
if [[ $PRESENT == "false" ]]; then
  echo "[+] Adding DOT_FOLDER and DOT_CONFIG_FOLDER to .env"
  echo "DOT_FOLDER=$SCRIPT_DIR" >>$HOME/.env
  echo "DOT_CONFIG_FOLDER=$SCRIPT_DIR/.config" >>$HOME/.env
fi

# reload shell once installed
echo "[+] Reloading shell..."
exec $SHELL -l
