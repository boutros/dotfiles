cd $HOME
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/boutros/dotfiles $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
rm .bashrc
config checkout
