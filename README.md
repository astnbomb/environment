# environment

cd ~
git clone https://github.com/astnbomb/environment.git .environment
ln -sf .environment/.bashrc
ln -sf .environment/.tmux.conf
ln -sf .environment/.bash_alias
ln -sf .environment/scripts
mkdir -p ~/.config/nvim
ln -s .environment/.nvimrc ~/.config/nvim/init.vim


#install neovim on centos
# sudo yum -y install epel-release
# sudo curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
# sudo yum -y install neovim
