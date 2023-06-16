#!/bin/sh
dir=$1
last_dir=$(basename $dir)
echo $last_dir
if [ "$3" = "clean" ];then
	arduino-cli compile --clean --fqbn m5stack:esp32:m5stack-core2 $dir/$last_dir.ino 
elif [ "$3" = "d" ];then
	arduino-cli upload -p $2 --fqbn m5stack:esp32:m5stack-core2 $dir
elif [ "$3" = "c" ];then
	arduino-cli compile --fqbn m5stack:esp32:m5stack-core2 $dir/$last_dir.ino -v
else
	arduino-cli compile --fqbn m5stack:esp32:m5stack-core2 $dir/$last_dir.ino -v
	arduino-cli upload -p $2 --fqbn m5stack:esp32:m5stack-core2 $dir
fi

