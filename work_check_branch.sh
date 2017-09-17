#!/bin/bash
## 查看当前目录内所有git仓库的所有分支

switch_to_release() {
	# 对目录内每个文件
	for file in `ls $1`
	do
		# 如果这个文件是一个目录
		if [ -d "$1/$file" ]; then
			echo "--------------------------------------------------------------"
			# 输出目录路径并切换目录
			echo "cd $1/$file"
			cd $1/$file
			pwd

			# 异常处理，如果已经存在release分支，则输出异常
			{
				# 建立release分支映射
				git branch -a
			} || {
				echo "branch release already exist in $1/$file"
			}
			# 返回上层目录
			cd ..	
		fi
	done
}

switch_to_release .
			
