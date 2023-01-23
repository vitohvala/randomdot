#!/bin/sh
#
bat_perc=$(cat /sys/class/power_supply/BAT0/capacity)
bat_state=$(cat /sys/class/power_supply/BAT0/status)

s= ;

[ $bat_perc = 100 ] && s='';

[ $bat_state = "Charging"  ] && printf "$s  " 


if [ $bat_perc -gt 95 ] ; then
		echo 
elif [ $bat_perc \> 65 ] && [ $bat_perc \< 96 ] 
then 
		echo 
elif [ $bat_perc \> 40 ] && [ $bat_perc \< 66 ] 
then 
		echo 
elif [ $bat_perc \> 25 ] && [ $bat_perc \< 41 ] 
then 
		echo 
else echo 
fi
