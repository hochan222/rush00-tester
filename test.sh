SUCCESS_COLOR="\033[42;1;37m"
FAIL_COLOR="\033[41;5;11m"
CLEAR_COLOR="\033[m"

# 4 for rush00.c ~ rush04.c
RUSH_COUNT=4
# General Testcase Count
RUSH_GENERAL_TESTCASE=5

echo "Check file list"
echo "================================="

function isfile {
	local PATH='../'$1 
	if test -f $PATH;then
		return 0
	else
		return 1
	fi
}

function isSuccess {
	if [ $? -eq 0 ]
	then
		echo "$1 ${SUCCESS_COLOR}SUCCESS${CLEAR_COLOR}"
	else
		echo "$1 ${RUSH_FILE} ${FAIL_COLOR}FAIL${CLEAR_COLOR}"
	fi
}

function addHeader {
	awk '{ if (NR==13) { print "#include \"rush.h\"\n"; print $0 } else { print $0 } }' ../$1 > ./src/$1
}

function makefile {
	addHeader $1
	gcc -Wall -Wextra -Werror -g -I ./includes/ ./src/ft_putchar.c ./src/$1 ./src/main.c -o $2
}

function evaluation {
	local count=0
	mkdir -p output/$1

	for i in `seq 0 ${RUSH_GENERAL_TESTCASE}`
	do
		for j in `seq 0 ${RUSH_GENERAL_TESTCASE}`
		do
			./$1 ${i} ${j} > ./output/$1/${count}
			diff -u ./output/$1/${count} ./maps/$1/${count}
			isSuccess "File: $1/${count}"
			count=$(($count+1))
		done
	done
}

# ft_putchar File
isfile ft_putchar.c
if [ $? -eq 0 ]
then
	echo "\n================================="
	echo "ft_putchar.c ${SUCCESS_COLOR}file exist${CLEAR_COLOR}"
	echo "================================="
	addHeader ft_putchar.c
else
	echo "\n================================="
	echo "ft_putchar.c ${FAIL_COLOR}file not exist${CLEAR_COLOR}"
	echo "================================="
fi

# Rush File
for i in `seq 0 ${RUSH_COUNT}`
do
	RUSH_FILE=rush0${i}.c
	isfile $RUSH_FILE
	if [ $? -eq 0 ]
	then
		echo "\n================================="
		echo "${RUSH_FILE} ${SUCCESS_COLOR}file exist${CLEAR_COLOR}"
		echo "================================="
		makefile $RUSH_FILE rush0${i}
		evaluation rush0${i}
	else
		echo "\n================================="
		echo "${RUSH_FILE} ${FAIL_COLOR}file not exist${CLEAR_COLOR}"
		echo "================================="
	fi
done
