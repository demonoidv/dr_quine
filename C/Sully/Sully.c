#include <stdio.h>

#define NUM 5
#define AS_STR(s) #s
#define DECR_AS_STR(n) AS_STR(n - 1)
#define CHILD_NUM(n) "Sully_" #n
#define CHILD(n) CHILD_NUM(n)
#define COMPILE(n) "/usr/bin/gcc -Wall -Werror -Wextra -o " CHILD_NUM(n) " " CHILD_NUM(n) ".c"

// Maybe try with gcc -D and some ifndef/ifdef directive in the code
int	main(void)
{
	int		i = NUM;
	char	*code = "";
	char	*params[7] = {"-Wall", "-Werror", "-Wextra", "-o", CHILD(NUM), CHILD(NUM) ".c", NULL};

	// FILE	*handle = fopen(CHILD(NUM), "w");
	// if (handle)
	// {
	// 	fprintf(handle, code, '\n', '\\', '"', code, NUM - 1);
printf("%s\n", COMPILE(NUM));
	// }
	// return -1;
	return 0;
}
