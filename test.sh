# Color
RED_COLOR="\033[31m"
LIGHT_RED_COLOR="\033[31m\033[01m"
GREEN_COLOR="\033[32m"
LIGHT_GREEN_COLOR="\033[32m\033[01m"
YELLOW_COLOR="\033[33m"
BLUE_COLOR="\033[34m"
LIGHT_BLUE_COLOR="\033[34m\033[01m"
LIGHT_SKYBLUE_COLOR="\033[36m\033[01m"
# Background color
SUCCESS_COLOR="\033[42;1;37m"
FAIL_COLOR="\033[41;5;11m"
CLEAR_COLOR="\033[m"

# 4 for rush00.c ~ rush04.c
RUSH_COUNT=4
# General Testcase Count
RUSH_GENERAL_TESTCASE=10

prompt() {
	clear
	echo "${LIGHT_RED_COLOR}Run this script in the folder you created that contains ft_putchar and rush files."
	echo "Any invalid behavior in your program is treated as a test failure." 
	echo "${LIGHT_SKYBLUE_COLOR}For additional test cases or other inquiries, please contact at the address below. :)\n\n"
	echo "     Github: hochan222."
	echo "     Email : hochan049@gmail.co${CLEAR_COLOR}\n"
	echo "\n\n${LIGHT_GREEN_COLOR}PRESS ENTER : ${CLEAR_COLOR}"
	read
	clear
}

isfile() {
	local PATH='../'$1 
	if test -f $PATH;then
		return 0
	else
		return 1
	fi
}

isSuccess() {
	if [ $? -eq 0 ]
	then
		echo "$1 ${SUCCESS_COLOR}SUCCESS${CLEAR_COLOR}"
	else
		echo ">> $1 ">> result
		echo "$1 ${RUSH_FILE} ${FAIL_COLOR}FAIL${CLEAR_COLOR}"
	fi
}

customEcho() {
	echo "\n================================="
	echo "${LIGHT_BLUE_COLOR}$1${GREEN_COLOR} $2${CLEAR_COLOR}"
	echo "================================="
}

customEvaluation() {
	mkdir -p output/$1/custom
	./$1 $2 $3 > ./output/$1/custom/$4
	diff -u ./output/$1/custom/$4 ./maps/$1/custom/$4 >> result
	isSuccess "$1 rush($2, $3), File: $1/$4"
}

addHeader() {
	awk '{ if (NR==13) { print "#include \"rush.h\"\n"; print $0 } else { print $0 } }' ../$1 > ./src/$1
}

makefile() {
	addHeader $1
	gcc -Wall -Wextra -Werror -g -I ./includes/ ./src/ft_putchar.c ./src/$1 ./src/main.c -o $2
}

evaluation() {
	local count=0
	mkdir -p output/$1

	for i in `seq 0 ${RUSH_GENERAL_TESTCASE}`
	do
		for j in `seq 0 ${RUSH_GENERAL_TESTCASE}`
		do
			./$1 ${i} ${j} > ./output/$1/${count}
			diff -u ./output/$1/${count} ./maps/$1/${count} >> result
			isSuccess "Input rush(${i}, ${j}), File: $1/${count}"
			count=$(($count+1))
		done
	done
}

prompt 

# delete result file
rm -rf result

# ft_putchar File
isfile ft_putchar.c
if [ $? -eq 0 ]
then
	echo "\n================================="
	echo "${GREEN_COLOR}ft_putchar.c ${SUCCESS_COLOR}file exist${CLEAR_COLOR}"
	echo "================================="
	addHeader ft_putchar.c
else
	echo "\n================================="
	echo "${RED_COLOR}ft_putchar.c ${FAIL_COLOR}file not exist${CLEAR_COLOR}"
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
		echo "${GREEN_COLOR}${RUSH_FILE} ${SUCCESS_COLOR}file exist${CLEAR_COLOR}"
		echo "================================="
		makefile $RUSH_FILE rush0${i}
		evaluation rush0${i}
	else
		echo "\n================================="
		echo "${RED_COLOR}${RUSH_FILE} ${FAIL_COLOR}file not exist${CLEAR_COLOR}"
		echo "================================="
	fi
done

# ======================================================================================================
# * Please PR by adding it according to the format below this!
# * Two functions created will help you in adding test cases.
# * We will reflect after review :)
# * 
# * < Function: customEvaluation >
# * 
# * When adding a test case, use this function to add it.
# * 
# * @param	string	The name of rush file to run.
# * @param	int		The first argument i in the rush(i, j) function.
# * @param	int		The second argument j in the rush(i, j) function.
# * @param	int		The name of the file to be saved. 
# * 				It increases in order from 0, and add 1 value from the previous test case.
# * @return	void
# *
# * < Function: customEcho >
# *
# *	This function is used to display test cases by dividing them into sections.
# *	
# * @param	string	The name of rush file to run.
# *	@param	string	Please write the section to be printed
# * @return	void
# *
# * For other inquiries, please slack with holee. Thank you. :)
# ======================================================================================================

# =================
# < Custom Rush00 >
# =================

customEcho rush00 considerNegative
customEvaluation rush00 0 -1 0
customEvaluation rush00 -10 -1 1

# =================
# < Custom Rush01 >
# =================
customEcho rush01 considerNegative
customEvaluation rush01 0 -1 0
customEvaluation rush01 -10 -1 1

# =================
# < Custom Rush02 >
# =================
customEcho rush02 considerNegative
customEvaluation rush02 0 -1 0
customEvaluation rush02 -10 -1 1

# =================
# < Custom Rush03 >
# =================
customEcho rush03 considerNegative
customEvaluation rush03 0 -1 0
customEvaluation rush03 -10 -1 1

# =================
# < Custom Rush04 >
# =================
customEcho rush04 considerNegative
customEvaluation rush04 0 -1 0
customEvaluation rush04 -10 -1 1
