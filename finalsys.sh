#!/bin/bash
dt=$(date +%Y%m%d)
path=/home/jane/sys-usage_$dt.txt
echo "Getting cpu-memory usage"
echo "CPU-Memory Usage" >> $path
echo " " >> $path
top -b -n 1 | head -30 >> $path

echo " " >> $path
echo " " >> $path
echo "Getting disk usage"
echo "Disk Usage" >> $path
echo " " >> $path
df -mh >> $path
echo " " >> $path
echo " " >> $path

echo "Getting network statistics:"
echo "Network Statistics" >> $path
echo " " >> $path
netstat -tulpn >> $path 
echo " " >> $path
echo " " >> $path

echo "Getting users logged-in"
echo "Users logged-in" >> $path
echo " " >> $path
w >> $path
echo " " >> $path
echo " " >> $path
echo "Adding files to git"
mv $path /home/script/Testing-repo
cd /home/script/Testing-repo
git add sys-usage_$dt.txt
git commit -m "usage added"
git push origin master

echo "Files added"
echo "Copying files to your system"
echo "In Testing-repo"
scp sys-usage_$dt.txt simar@10.0.2.4:/home/simar/Desktop/script/sys-usage_$dt,txt
echo "File is copied"
