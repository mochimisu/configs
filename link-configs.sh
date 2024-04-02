#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
mkdir -p ~/.config

ln -s $SCRIPT_DIR/.tmux.conf ~/.tmux.conf
ln -s $SCRIPT_DIR/.tmuxline.conf ~/.tmuxline.conf

for f in $(ls $SCRIPT_DIR/configs); do
  ln -s $SCRIPT_DIR/configs/$f ~/.config/$f
done

