# !/bin/bash
cnt=1
for var in {1..9};do	
	while [ "$cnt" != "$var" ];do	
		echo -n "a" >>~/test/"$var".txt
		cnt=$(($cnt+1))
	done
cnt=1
done