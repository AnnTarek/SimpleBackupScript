if [ "$#" -ne 4 ]; then
echo "Enter: <source=source_folder> <backup=backup_folder> <seconds=seconds_number> <max_folders=max_number>"
exit 1
fi
source_dir=$1
backup_dir=$2
max=$4
max=$((max+1))
while :
do
ls -lR $source_dir > directory-info.new.txt
dummy= diff directory-info.last.txt directory-info.new.txt
if [ $? == 0 ];then
  echo "no change"
else
  echo "folder changed"
current_time=$(date +'%Y%m%d-%H%M%S')
mkdir $backup_dir/$current_time
cp -r $source_dir $backup_dir/$current_time
fi
cat directory-info.new.txt > directory-info.last.xt
number=$(ls backup | wc -l) 
if [[ $number -eq $max ]];then 
  folder=$(ls $backup_dir | head -1)
  rm -r $backup_dir/$folder
fi
sleep $3
done
