#!/bin/bash
#wt=$(wttr)
#numb=$(echo $wt | awk '{if(NR==4) print $5}')
#state=$(echo $wt | awk '{if(NR==3) print $5}')
file="/home/$USER/.scripts/data/tempo"
op="/home/$USER/.scripts/data/estado"
while true
do
	wt=$(wttr)
	echo $wt > $file 
	state=$(cat $file | awk '{print $8}')
	num=$(cat $file | awk '{print $13}')
	printf "#!/bin/bash\necho %s %sºC" $state $num | sed "s/^[[38;5;154m//;s/^[[0m//" > $op
	sleep 3600
done
