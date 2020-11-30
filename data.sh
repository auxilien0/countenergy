#!/bin/bash
# $1 = id of device
# $2 = main folder name
# $3 = main folder name parts
# $4 = any string to delete storage

# create folders if they not exists
mkdir -p "files/csvs/$2";
# config
mainfilename="$1.csv";
mainfileinfolder="files/csvs/$2/$mainfilename";
mainfilepartsprefix="files/csvs-parts/$3/part_";
filename=`date +%Y-%m-%d_%H:%M:%S`.csv;
# login and fetch cookies
wget --save-cookies cookies --keep-session-cookies --post-data 'username=Gabriel&password=Zoubek2020&submit=+Enter+%C2%BB+' --delete-after http://sensorfor.com/cloud/login.php &&
# download file with cookies
wget --load-cookies cookies -O "files/csvs/$2/$filename" "http://sensorfor.com/cloud/device_csv_get.php?id=00$1" || rm -f $filename &&
if [ ! -f "files/csvs/$2/$filename" ]; then
  echo "File does not exist at all.";
  exit 1
fi
if grep -q "File does not exist." "files/csvs/$2/$filename"; then
  echo "File does not exist.";
  rm -f "files/csvs/$2/$filename";
  exit 1
fi
# sleep before executting awk 200ms
sleep 0.2 &&
# append to file
cat "files/csvs/$2/$filename" >> $mainfileinfolder &&
# sort and remove duplicates in files
awk '!a[$0]++' $mainfileinfolder > $mainfileinfolder.tmp &&
# copy file to main
mv $mainfileinfolder.tmp $mainfileinfolder &&
# delete files except main file
find files/csvs/$2/*.csv -type f -not -name $mainfilename -delete &&
# split file to smaller files || only if argument was passed to do
if [ ! -z "$3" ]; then
  mkdir -p "files/csvs-parts/$3" &&
  split -d -l 1000 --additional-suffix=.csv $mainfileinfolder $mainfilepartsprefix;
fi
if [ ! -z "$4" ]; then
  echo "YES TO DELETE";
  # clear existed data in cloud
  wget --load-cookies cookies --delete-after "http://sensorfor.com/cloud/device_clear.php?id=00$1";
fi
# push to git
# sh gitdeleteremote.sh
