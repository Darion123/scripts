#!/bin/bash
len(){
	local n=0
	for i in $ARRAY; do
		n=$(($n+1))
	done
	printf $n
}
addfolder(){
	#USO: addfolder $numero_da_repo
	local folder; local path
	local repo=$(cat $HOME/.scripts/dotfilesf/repo$1 | grep "repo=" | cut -f 2 -d "\"" )
	local number=$(($(cat $HOME/.scripts/dotfilesf/repo$1 | grep "path" | wc -l)+1))
	printf "Add a folder:"
	read folder
	printf "Copy to:"
	printf "$repo/"read path
	printf "path$number=\"$repo/$path

}
addrepo(){
	local number=$(ls -l $HOME/.scripts/dotfilesf/repo* | wc -l)
	local repo
	printf "Nome do repositório:\n"
	read repo
	printf "repo=\"$repo\"" #to $HOME/.scripts/dotfilesf/repo$number
}
change(){
	printf "What do you want to change?\n1-add repository\n2-change existing repository"
	read resp
	case $resp in
		"1")
			ARRAY=$(ls $HOME/.scripts/dotfilesf/repo*)
			numb=$(($(len)+1))
			printf "Path to the repository:"
			read path
			;;
	esac
}
