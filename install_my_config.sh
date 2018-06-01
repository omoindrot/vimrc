# Install zsh and oh-my-zsh
cd ~
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cd ~/.vim_runtime
cat ~/.vim_runtime/configs/tmux.conf > ~/.tmux.conf
echo "Installed tmux configuration successfully! Enjoy :-)"

cat ~/.vim_runtime/configs/gitconfig > ~/.gitconfig
echo "Installed git configuration successfully! Enjoy :-)"

cat ~/.vim_runtime/configs/bash_profile > ~/.bash_profile
echo "Installed bash_profile"

cat ~/.vim_runtime/configs/gitignore > ~/.gitignore
echo "Installed user .gitignore"

cat ~/.vim_runtime/configs/ipython_config.py > ~/.ipython/profile_default/ipython_config.py
echo "Installed user .gitignore"
