SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

brew bundle
ln -svn ${SCRIPT_DIR}/kitty ~/.config/kitty
ln -svn ${SCRIPT_DIR}/nvim ~/.config/nvim
ln -svn ${SCRIPT_DIR}/.zshrc ~/.zshrc
source git/install.sh
