#! /bin/bash
## 杀死TIM进程

PROCESS="TIM.exe"
# PID=$(ps -ef | grep $PROCESS | grep -v grep | awk '{print $2}')
PID=$(ps -ef | grep $PROCESS | grep -v grep | awk '{print $2}')

if ps -p $PID > /dev/null
then
	echo "$PROCESS is running. now shutdown $PID"
	kill -9 $PID
	# Do something knowing the pid exists, i.e. the process with $PID is running.
fi
