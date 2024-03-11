#!/bin/bash 

read -p "Enter desired action [backup/restore]: " ACTION

if [ "$ACTION" == "backup" ]; then
  echo "Backing up dotfiles into Git repo."
  cp -R ~/.config/nvim/lua/custom/* nvim/lua/custom/
  cp ~/.config/tmux/tmux.conf tmux/
elif [ "$ACTION" == "restore" ]; then
  echo "Restoring dotfiles into profile."
  cp -R nvim/lua/custom/* ~/.config/nvim/lua/custom/ 
  cp tmux/tmux.conf ~/.config/tmux/tmux.conf
fi 
