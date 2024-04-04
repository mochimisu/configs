#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
mkdir -p ~/.config

ln -s $SCRIPT_DIR/.tmux.conf ~/.tmux.conf
ln -s $SCRIPT_DIR/.tmuxline.conf ~/.tmuxline.conf

for f in $(ls $SCRIPT_DIR/.config); do
  ln -s $SCRIPT_DIR/.config/$f ~/.config/$f
done

