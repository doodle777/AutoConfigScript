#!/bin/bash
##登录/退出 w.seu.edu.cn

export LANG=zh_CN.UTF-8

COMMAND=$1
LOGIN_URL=https://w.seu.edu.cn/index.php/index/login
LOGOUT_URL=https://w.seu.edu.cn/index.php/index/logout

USERNAME=220151538
PASSWORD=dx2010001

if [ $1 = "login" ]; then
	if [ $# -eq 3 ]; then
		echo "使用用户传入参数"
		USERNAME=$2
		PASSWORD=$3
	fi
	PASSWORD_ENCODE=`echo -n $PASSWORD | base64`
	RESPONSE=`curl -s -X POST --data "username=$USERNAME&password=$PASSWORD_ENCODE" $LOGIN_URL`
	echo -e $RESPONSE
fi

if [ $1 = "logout" ]; then
	RESPONSE=`curl -s $LOGOUT_URL`
	echo -e $RESPONSE
fi
