source="/home/coolearth/logs/aaa/"
dest="/home/coolearth/logs/bbb /home/coolearth/logs/ccc"
mkdir -p $source
i=0
batch=10
cpstr=""
echo ${dest}|xargs -n1 mkdir -p
find $source -type f |while read file_name
do
	if [[ $i -ne 0 && `expr $i % $batch` -eq 0 ]]
	then
		#echo $cpstr
		#cpnewstr="${cpstr// /,}"
		#echo "$cpnewstr"
		#echo ${dest}|xargs -n1 cp ${source}{${cpnewstr}}
		echo ${dest}|xargs -n1 cp ${cpstr}
		cpstr=""
	fi
	#origin_name=${file_name:${#source}}
	origin_name=${file_name}
	if [ "${cpstr}" = "" ]
	then
		cpstr="${origin_name}"
	else
		cpstr="$cpstr ${origin_name}"
	fi
	echo "xxx"
	let i++
done
echo $cpstr
if [ "${cpstr}" != "" ]
then
	echo ${dest}|xargs -n1 cp ${cpstr}
fi

