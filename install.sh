#!/bin/sh

cp -r $HOME/Dotfiles/dotconfig/* $HOME/.config

cp -r $HOME/Dotfiles/dothome/* $HOME

mkdir -p $HOME/.local/bin
cp -r $HOME/Dotfiles/dotlocal/* $HOME/.local/bin
chmod 755 $HOME/.local/bin
