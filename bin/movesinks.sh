#!/bin/bash

# Hard-coded sinks
# 0: headphones
# 1: yeti microphone
# 2: hdmi/dp

# case $1 in
# hp)
#     sink_num=0
#     ;;
# mp)
#     sink_num=1
#     ;;
# dp)
#     sink_num=2
#     ;;
# esac

# echo $sink_num

# pacmd set-default-sink $sink_num
# pacmd link-sink-inputs | grep index | while read line
# do
# echo "Moving input: ";
# echo $line | cut -f2 -d' ';
# echo "to sink $sink_num";
# pacmd move-sink-input `echo $line | cut -f2 -d' '` $sink_num
# done

pacmd set-default-sink $1
pacmd list-sink-inputs | grep index | while read line
do
echo "Moving input: ";
echo $line | cut -f2 -d' ';
echo "to sink: $1";
pacmd move-sink-input `echo $line | cut -f2 -d' '` $1

done
