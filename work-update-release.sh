#!/bin/bash
##更新当前目录下所有git仓库release分支到最新版本

pull_release() {
	# 对目录内每个文件
	for file in `ls $1`
	do
		# 如果这个文件是一个目录
		if [ -d "$1/$file" ]; then
			echo "--------------------------------------------------------------"
			# 输出目录路径并切换目录
			echo "cd $1/$file"
			cd $1/$file

			# 异常处理，如果已经存在release分支，则输出异常
			{
				# 建立release分支映射
				git pull
			} || {
				echo "pull fail - branch release"
			}
			# 返回上层目录
			cd ..	
		fi
	done
}

pull_release .
			
