# rush00-tester
**[Rush00 Tester (piscine) | 2020.10](https://github.com/hochan222/rush00-tester)**  
**[Rush01 Tester (piscine) | 2020.10](https://github.com/hochan222/rush01-tester)**  

문제 풀 때와 동료평가시 활용해보세요.   
[사용 방법](#사용방법)  
추가하고싶은 테스트 케이스가 있으면 PR이나 Issue로 남겨주세요! 언제나 환영입니다 :)  

Use it for problem solving and peer evaluation.  
[How to use](#사용방법)  
If you have a test case you want to add, please leave it as a PR or Issue! It's always welcome :)  

![test](https://user-images.githubusercontent.com/22424891/96735404-82aa1800-13f6-11eb-9fd7-b7fb84210043.gif)  

### 사용방법

```
.
├── ft_putchar.c
├── rush00.c
├── rush01.c
├── rush02.c
├── rush03.c
├── rush04.c
├── _rush00-tester
|   ├── _includes
|   ├── _maps
|   ├── _src
|   ├── .gitignore
|   ├── LICENSE
|   └── README.md
|   └── test.sh
|   ├── ...
└── ...
```

다음 파일들이 있는 폴더 안에 <code>git clone</code> 해주세요.  
<code>git clone</code> in the folder containing the following files.

>ft_putchar.c rush00.c rush01.c rush02.c rush03.c rush04.c

```bash
git clone https://github.com/hochan222/rush00-tester.git

cd rush00-tester
sh test.sh
```

> 생성된 result 파일에 diff 기록이 생성됩니다.
> A diff record is created in the generated result file.

<img src="https://user-images.githubusercontent.com/22424891/96731034-c8b0ad00-13f1-11eb-81e8-c896fc0d6cd5.png" height="200px" />

### How to contribute to rush00-tester

1. Please refer to the guide at the bottom of the test.sh file first.
    - There are function descriptions and how to use them.
    - Function: customEvaluation, customEcho
```sh
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
# * @param	string	Please write the section to be printed
# * @return	void
```
2. Please check if there are any test cases that overlap with previous test cases.

```sh
# =================
# < Custom Rush0X >
# =================
```
3. Add the test case to the appropriately named comment location. The comments are as above. Here is an additional example:
```sh
customEcho rush00 considerNegative
customEvaluation rush00 0 -1 0
```
4. Add the test case output file to the maps/rush0X/custom folder at the last number.
5. Please send PR including explanation and result screen.
6. For other inquiries, please slack with holee. Thank you. :)

### norminette

> norminette -R CheckForbiddenSourceHeader

### Patch Note

- Extend 121 testcases (11 x 11) | 2020.10
- Add negative testcases | 2020.10

### Contributor

<table>
  <tr>
    <td align="center"><a href="https://github.com/hochan222"><img src="https://avatars3.githubusercontent.com/u/22424891?s=100&v=4" alt="@hochan222" /><br /><sub><b>holee</b></sub></a>
    <br />
    <!-- <a href="#question-kentcdodds" title="Answering Questions">💬</a> -->
    </td>
    <td align="center"><a href="https://github.com/ji-junhyuk"><img src="https://avatars.githubusercontent.com/u/67992469?s=100&v=4" alt="@ji-junhyuk" /><br /><sub><b>ji-junhyuk</b></sub></a>
    <br />
    <a href="https://github.com/hochan222/rush00-tester/issues/1" title="Answering Questions">💬</a>
    </td>
    </tr>
</table>

- - -
기타 문의 사항은 Slack ID holee로 DM 주세요!
