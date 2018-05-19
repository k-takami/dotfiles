cd ~
# git clone https://github.com/k-takami/dotfiles.git ~/.dotfiles
mkdir .dotfiles/BAKUP
mv .*rc .dotfiles/BAKUP/
mv .ve_favorite .dotfiles/BAKUP/
mv *vimrc .dotfiles/BAKUP/
mv .vim .dotfiles/BAKUP/
mv *vimrc* .dotfiles/BAKUP/
mv gitconfig.txt .dotfiles/BAKUP/
mv .bashrc.mae .dotfiles/BAKUP/
cp  .*history .dotfiles/BAKUP/
mv .NERDTreeBookmarks .dotfiles/BAKUP/
cp -pr .unite/ .dotfiles/BAKUP/

