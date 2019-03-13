# Install zsh and oh-my-zsh
cd ~
if ! [ -x "$(command -v zsh)" ]; then
    echo "Error: zsh is not installed." >&2
    echo "Install it with `sudo apt-get install zsh`"
    echo "And install oh-my-zsh also"
    echo "With `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`"
    exit 1
fi

cd ~/.vim_runtime
cp ~/.vim_runtime/dotfiles/tmux.conf ~/.tmux.conf
echo "Installed tmux configuration successfully! Enjoy :-)"

cp ~/.vim_runtime/dotfiles/gitconfig ~/.gitconfig
echo "Installed git configuration successfully! Enjoy :-)"

cp ~/.vim_runtime/dotfiles/bash_profile ~/.bash_profile
echo "Installed bash_profile"

cp ~/.vim_runtime/dotfiles/gitignore ~/.gitignore
echo "Installed user .gitignore"

cp ~/.vim_runtime/dotfiles/ipython_config.py ~/.ipython/profile_default/ipython_config.py
echo "Installed user ipython_config.py"

cp ~/.vim_runtime/dotfiles/custom.js ~/.jupyter/custom/custom.js
echo "Installed user jupyter config"

cp ~/.vim_runtime/dotfiles/custom.zsh ~/.oh-my-zsh/custom/custom.zsh
echo "Installed my zsh custom config"


# Install pure prompt for zsh
# Clone it in the .oh-my-zsh repo
PURE_FOLDER="$HOME/.oh-my-zsh/custom/plugins/pure"
if [ ! -d "$PURE_FOLDER" ] ; then
    git clone https://github.com/sindresorhus/pure ~/.oh-my-zsh/custom/plugins/pure
fi
# Link the files to ~/.zfunctions (which is added in the $fpath)
mkdir -p "$HOME/.zfunctions"
# Give correct rights
chmod 755 "$HOME/.zfunctions"
ln -s "$HOME/.oh-my-zsh/custom/plugins/pure/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
ln -s "$HOME/.oh-my-zsh/custom/plugins/pure/async.zsh" "$HOME/.zfunctions/async"
