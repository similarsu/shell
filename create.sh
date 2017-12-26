int=1
dest=/home/coolearth/logs/aaa
mkdir -p ${dest}
while(( $int<=11230 ))
do
	touch ${dest}/${int}.log
	let "int++"
done
