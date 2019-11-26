#include <stdio.h>

#define CODE "#include <stdio.h>%1$c%1$c#define CODE %3$c%4$s%3$c%1$c/*%1$c	This is a comment.%1$c*/%1$c#define CHILD %3$cGrace_kid.c%3$c%1$c%1$c#define MAIN(x) int	main(void)%2$c%1$c{%2$c%1$c	FILE	*handle = fopen(CHILD, %3$cw%3$c);%2$c%1$c	if (handle)%2$c%1$c	{%2$c%1$c		fprintf(handle, CODE, '%2$cn', '%2$c%2$c', '%3$c', CODE);%2$c%1$c		fclose(handle);%2$c%1$c		return 0;%2$c%1$c	}%2$c%1$c	return -1;%2$c%1$c}%1$c%1$cMAIN(x)%1$c"
/*
	This is a comment.
*/
#define CHILD "Grace_kid.c"

#define MAIN(x) int	main(void)\
{\
	FILE	*handle = fopen(CHILD, "w");\
	if (handle)\
	{\
		fprintf(handle, CODE, '\n', '\\', '"', CODE);\
		fclose(handle);\
		return 0;\
	}\
	return -1;\
}

MAIN(x)
