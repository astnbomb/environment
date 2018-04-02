```
cd ~
git clone https://github.com/astnbomb/environment.git .environment
ln -sf .environment/.bashrc
ln -sf .environment/.tmux.conf
ln -sf .environment/.bash_alias
ln -sf .environment/scripts
mkdir -p ~/.config/nvim
ln -s .environment/.nvimrc ~/.config/nvim/init.vim
ln -s .environment/pydocstring/ ~/.config/nvim/pydocstring


#install neovim on centos
# sudo yum -y install epel-release
# sudo curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
# sudo yum -y install neovim
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# sudo yum install python34-setuptools
# sudo easy_install-3.4 pip
# pip3 install neovim
```
