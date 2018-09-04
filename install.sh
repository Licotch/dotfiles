#!/bin/bash

set -eu

THIS_DIR=$(cd $(dirname $0);pwd)

cd $THIS_DIR

git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".config" ] && continue

    ln -snfv $THIS_DIR/$f ~/
done

./zshrc/install.sh
./vimrc/install.sh

echo "setup .config..."
if [ ! -e ~/.config ]; then
    mkdir ~/.config
fi
cd $THIS_DIR/.config
for f in *; do
    ln -snfv $THIS_DIR/.config/$f ~/.config/
done

cat << END

+++++++++++++++++++++++++++++++
DOTFILES SETUP FINISHED! bye.
+++++++++++++++++++++++++++++++

END
