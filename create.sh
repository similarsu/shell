int=1
dest=aaa
mkdir ${dest}
while(( $int<=123 ))
do
	echo $int
	touch ${dest}/${int}.log
	let "int++"
done
