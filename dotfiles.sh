#!/bin/bash
# mais um script mau e inutil do dario
dir=$(pwd)
dconfig="/home/$USER/Documents/Gitlab/dotfiles/.config"
dhome="/home/$USER/Documents/Gitlab/dotfiles/home"
config=$(ls -a $dconfig)
home=$(ls -a $dhome) 
func()
{
for i in ${config[*]}
do
	case $i in 
		. | ..)
			;;
		*)
			cp -r ~/.config/$i $dconfig
			printf "copied %s to %s\n" $i $dconfig
			;;
	esac
done
for i in ${home[*]}
do
	case $i in 
		. | ..)
			;;
		*)
			cp -r ~/$i $dhome
			printf "copied %s to %s\n" $i $dhome
			;;
	esac
done
return 0
}
case $1 in
	"")
		func && notify-send ' All files backed up!' -u low || notify-send " An error ocurred" "Files might not have been backed up"
		;;
	*)
		func || notify-send " An error ocurred" "Files might not have been backed up"
		cd ~/Documents/Gitlab/dotfiles
		git add * && git add .*
		git commit -a -m $1
		git push && notify-send ' All files backed up!' -u low ' And on your repository!'|| notify-send " An error ocurred" "Files might not have been backed up"
		cd $dir
		;;
esac
