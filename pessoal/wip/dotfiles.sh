#!/bin/bash
current=$(pwd)
cd
nvim="/home/$USER/.config/nvim"
alacritty="/home/$USER/.config/alacritty/"
vim="/home/$USER/.vimrc"
ncmpcpp="/home/$USER/.config/ncmpcpp"
xresources="/home/$USER/.Xresources"
zshrc="/home/$USER/.zshrc"
bashrc="/home/$USER/.bashrc"
mpd="/home/$USER/.config/mpd"
aliasrc="/home/$USER/.config/aliasrc"
scripts="/home/$USER/.scripts"
dwm="/home/$USER/.dwm"
arrayc=( $nvim $alacritty $aliasrc $ncmpcpp $mpd )
array=( $vim $zshrc $bashrc $xresources $dwm $scripts )
for i in ${array[@]}
do
	cp -r $i /home/$USER/Documents/Gitlab/dotfiles
done
for a in ${arrayc[@]}
do
	cp -r $a /home/$USER/Documents/Gitlab/dotfiles/.config
done
cd $current
