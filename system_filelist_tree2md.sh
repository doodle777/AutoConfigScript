#! /bin/sh
## 将当前目录内脚本格式化输出到markdown文件

FILE_PATH=$1
FILE_NAME=README.md

echo '# Scripts' > $FILE_NAME
echo '自用的一系列用于配置Linux以及改善工作效率的脚本' >> $FILE_NAME
echo >> $FILE_NAME

echo '## 脚本作用' >> $FILE_NAME
echo >> $FILE_NAME

echo '| 脚本路径 | 脚本作用 |' >> $FILE_NAME
echo '| -------- | -------- |' >> $FILE_NAME

# 遍历文件
for FILE in `ls $FILE_PATH`
do
	if [ -f "$FILE_PATH/$FILE" ]; then
		COMMENT=`head -n 3 "$FILE_PATH/$FILE" | grep "## " | sed 's/## \(.*\)$/\1/'`
		echo "| $FILE | $COMMENT |" >> $FILE_NAME
	fi
done

echo '## 目录树' >> $FILE_NAME
echo >> $FILE_NAME

tree $FILE_PATH | sed 's/$/&  /g' >> $FILE_NAME
