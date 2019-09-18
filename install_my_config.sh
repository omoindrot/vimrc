# Install zsh and oh-my-zsh
cd ~
if ! [ -x "$(command -v zsh)" ]; then
    echo "Error: zsh is not installed." >&2
    echo "Install it with `sudo apt-get install zsh`"
    echo "And install oh-my-zsh also"
    echo "With `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`"
    exit 1
fi

cd $HOME/.vim_runtime

mkdir -p "$HOME/.vim/indent"
cp "$HOME/.vim_runtime/dotfiles/python.vim" "$HOME/.vim/indent/python.vim"
echo "Installed user ipython config"

# cp ~/.vim_runtime/dotfiles/tmux.conf ~/.tmux.conf
ln -s -f $HOME/.vim_runtime/.tmux/.tmux.conf $HOME
cp $HOME/.vim_runtime/dotfiles/tmux.conf.local $HOME/.tmux.conf.local
echo "Installed tmux configuration successfully! Enjoy :-)"

cp ~/.vim_runtime/dotfiles/gitconfig ~/.gitconfig
echo "Installed git configuration successfully! Enjoy :-)"

cp ~/.vim_runtime/dotfiles/bash_profile ~/.bash_profile
echo "Installed bash_profile"

cp ~/.vim_runtime/dotfiles/gitignore_global ~/.gitignore_global
echo "Installed user .gitignore_global"

# ipython config
mkdir -p "$HOME/.ipython/profile_default"
mkdir -p "$HOME/.ipython/profile_default/startup"
cp "$HOME/.vim_runtime/dotfiles/ipython/ipython_config.py" "$HOME/.ipython/profile_default/ipython_config.py"
cp "$HOME/.vim_runtime/dotfiles/ipython/keybindings.py" "$HOME/.ipython/profile_default/startup/keybindings.py"
echo "Installed user ipython config"

# jupyter config
mkdir -p $HOME/.jupyter/custom
cp $HOME/.vim_runtime/dotfiles/custom.js $HOME/.jupyter/custom/custom.js
echo "Installed user jupyter config"

# zsh custom file
cp $HOME/.vim_runtime/dotfiles/custom.zsh $HOME/.oh-my-zsh/custom/custom.zsh
echo "Installed my zsh custom config"

# zsh custom file
cp $HOME/.vim_runtime/dotfiles/condarc $HOME/.condarc
echo "Installed condarc"


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

if [ ! -L "$HOME/.zfunctions/prompt_pure_setup" ] ; then
    ln -s "$HOME/.oh-my-zsh/custom/plugins/pure/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
fi
if [ ! -L "$HOME/.zfunctions/async" ] ; then
    ln -s "$HOME/.oh-my-zsh/custom/plugins/pure/async.zsh" "$HOME/.zfunctions/async"
fi
