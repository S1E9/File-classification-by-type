#!/bin/bash
cd /home/yize/Downloads
unzip un_sorted_files.zip
echo "Unzip Finished!" # unzip the original file

read -p "Enter script's name and 3 file types:" script_name tp1 tp2 tp3
# read scrpt's name and 3 assigned types 

cd /home/yize/Downloads/un_sorted_files
folder_name1=txt_files
folder_name2=jpeg_files
folder_name3=gif_files
folder_name4=docx_files
folder_name5=miscellaneous_files 

txt=txt
jpeg=jpeg
gif=gif
docx=docx

mkdir /home/yize/Downloads/$folder_name1
mkdir /home/yize/Downloads/$folder_name2
mkdir /home/yize/Downloads/$folder_name3
mkdir /home/yize/Downloads/$folder_name4
# create folders which contain each types of files

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
#cause some filename may contain space, by doing so script will not be interruptted by space 

txt_files=`find -name "*.txt"`
docx_files=`find . \( -name "*.docx" -o -name "*.DOC" \)`
gif_files=`find . \( -name "*.gif" -o -name "*.GIF" -o -name "A*.gif" \)`
jpeg_files=`find . \( -name "*.jpeg" -o -name "*.jpg" -o -name "A*.jpeg" \)`
# use find command to collect files which belongs to a same type and assign them to a sigle variable

for k1 in $txt_files
do mv $k1 /home/yize/Downloads/$folder_name1
done

for k2 in $jpeg_files
do mv $k2 /home/yize/Downloads/$folder_name2
done

for k3 in $gif_files
do mv $k3 /home/yize/Downloads/$folder_name3
done

for k4 in $docx_files
do mv $k4 /home/yize/Downloads/$folder_name4
done
# move files which found by 'find' to corrsponding directory

mv /home/yize/Downloads/un_sorted_files /home/yize/Downloads/$folder_name5
# rename the original folder to other_files cause what left inside happens to be the files we don't need

cd /home/yize/Downloads/$folder_name1
for k1_1 in `ls -S`
do echo "$k1_1" >> txt_list.txt # create a file that contains a list of all the files in that folder sorted by size order
done
cp txt_list.txt /home/yize/Downloads # copy this list to main folder for further usage
cd /home/yize/Downloads
sort -rf txt_list.txt -o txt_list.txt # sort the list in main folder by reverse alphabetical order
sed -i '1i\........All txt files:........' txt_list.txt # insert a descrption line

cd /home/yize/Downloads/$folder_name2
for k2_2 in `ls -S`
do echo "$k2_2" >> jpeg_list.txt
done
cp jpeg_list.txt /home/yize/Downloads
cd /home/yize/Downloads
sort -rf jpeg_list.txt -o jpeg_list.txt
sed -i '1i\........All jpeg files:........' jpeg_list.txt

cd /home/yize/Downloads/$folder_name3
for k3_3 in `ls -S`
do echo "$k3_3" >> gif_list.txt
done
cp gif_list.txt /home/yize/Downloads
cd /home/yize/Downloads
sort -rf gif_list.txt -o gif_list.txt
sed -i '1i\........All gif files:........' gif_list.txt

cd /home/yize/Downloads/$folder_name4
for k4_4 in `ls -S`
do echo "$k4_4" >> docx_list.txt
done
cp docx_list.txt /home/yize/Downloads
cd /home/yize/Downloads
sort -rf docx_list.txt -o docx_list.txt
sed -i '1i\........All docx files:........' docx_list.txt

cd /home/yize/Downloads/$folder_name5
for k5_5 in `ls -S`
do echo "$k5_5" >> other_list.txt
done
cp other_list.txt /home/yize/Downloads
cd /home/yize/Downloads
sort -rf other_list.txt -o other_list.txt
sed -i '1i\........All other files:........' other_list.txt



if [[ "$tp1" != "$txt" ]]&&[[ "$tp2" != "$txt" ]]&&[[ "$tp3" != "$txt" ]] ; then
	rm -rf /home/yize/Downloads/$folder_name1
	rm -rf /home/yize/Downloads/txt_list.txt
elif [[ "$tp1" != "$jpeg" ]]&&[[ "$tp2" != "$jpeg" ]]&&[[ "$tp3" != "$jpeg" ]] ; then
	rm -rf /home/yize/Downloads/$folder_name2
	rm -rf /home/yize/Downloads/jpeg_list.txt
elif [[ "$tp1" != "$gif" ]]&&[[ "$tp2" != "$gif" ]]&&[[ "$tp3" != "$gif" ]] ; then
	rm -rf /home/yize/Downloads/$folder_name3
	rm -rf /home/yize/Downloads/gif_list.txt
elif [[ "$tp1" != "$docx" ]]&&[[ "$tp2" != "$docx" ]]&&[[ "$tp3" != "$docx" ]] ; then
	rm -rf /home/yize/Downloads/$folder_name4
	rm -rf /home/yize/Downloads/docx_list.txt
fi
# delete unnecessary folder and file, only left the 3 we need

cd /home/yize/Downloads
cat *.txt > Final_Output.txt # merge the list file left, and form a final output file
rm *_list.txt # remove those temporary files in the main folder


IFS=$SAVEIFS

#It taks me almost a day to finish this task. Although I once have tried bash and unix, it has been a long time and I forgot most grammer and command of bash.So during this task I spent a lot of time on browering webpage of solution to some tiny problems. And to be honest I still think in this script, some approach is really silly. The resources on moodle help me a lot and give me a clear direction on how to finish the task step by step. It is really a tough work and I learnt a lot from it. My unix foundation becomes more solid and I know better how to search on web. Besides by finishing this task which I thought I cannot fully complete, I am more confident of facing the challenges in the future. I really enjoy this task!
