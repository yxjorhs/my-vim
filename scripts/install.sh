date=`date +%Y%m%d%H%M%S`
home=$HOME

if [ $1 ]
then
  home=$1
fi

# backup
vimrc=$home.vimrc
vim=$home.vim
bakSuff=.bak.$date
if [ -e $vimrc ]
then
  mv $vimrc $vimrc$bakSuff
fi

if [ -e $vim ]
then
  mv $vim $vim$bakSuff
fi

# install 
git clone https://github.com/VundleVim/Vundle.vim.git $home.vim/bundle/Vundle.vim &&
git clone https://github.com/yxjorhs/my-vim.git $home.vim/bundle/my-vim &&
ln $home.vim/bundle/my-vim/config/.vimrc $vimrc &&
ln $home.vim/bundle/my-vim/config/coc-settings.json $home.vim/coc-settings.json &&
vim +PluginInstall +qall &&
vim +"CocInstall coc-json coc-tsserver" +qall
