#!/bin/bash  
##杀死进程及其子进程

# kill process and child process  
ps --ppid $1| awk '{if($1~/[0-9]+/) print $1}'| xargs kill -9  
kill -9 $1  
echo 'over'  

# pstree pid -p| awk -F"[()]" '{print $2}'| xargs kill -9  
