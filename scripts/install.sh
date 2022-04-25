date=`date +%Y%m%d%H%M%S`
home=$HOME

if [ ! -x "$(command -v npm)" ] 
then
  echo "can not find npm"
  return
fi

# is input home 
if [ $1 ]
then
  home=$1
fi

# TODO 可以逐步安装, 下次安装时保留之前安装的进度

# backup
bakSuff=.bak.$date
if [ -e $home/.vimrc ]
then
  mv $home/.vimrc $home/.vimrc$bakSuff
fi

if [ -e $home/.vim ]
then
  mv $home/.vim $home/.vim$bakSuff
fi

# install 
mkdir $home/.vim &&
mkdir $home/.vim/bundle &&
cd $home/.vim/bundle/ &&
git clone https://github.com/VundleVim/Vundle.vim.git &&
git clone https://github.com/yxjorhs/my-vim.git &&
git clone https://github.com/Lokaltog/vim-distinguished.git &&
git clone https://github.com/neoclide/coc.nvim.git &&
cd coc.nvim && npm i &&
cd $home &&
ln $home/.vim/bundle/my-vim/config/.vimrc $vimrc &&
ln $home/.vim/bundle/my-vim/config/coc-settings.json $home/.vim/coc-settings.json &&
vim +PluginInstall +qall &&
vim +"CocInstall coc-json coc-tsserver" +qall
