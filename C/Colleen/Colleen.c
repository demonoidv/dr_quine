#include <stdio.h>

static char	*get_code()
{
	char	*code = "#include <stdio.h>%1$c%1$cstatic char	*get_code()%1$c{%1$c	char	*code = %3$c%4$s%3$c;%1$c%1$c	return code;%1$c}%1$c%1$c/*%1$c	This is a comment.%1$c*/%1$cint			main(void)%1$c{%1$c	/*%1$c		And this is another comment.%1$c	*/%1$c	printf(get_code(), '%2$cn', '%2$c%2$c', '%3$c', get_code());%1$c	return 0;%1$c}%1$c";

	return code;
}

/*
	This is a comment.
*/
int			main(void)
{
	/*
		And this is another comment.
	*/
	printf(get_code(), '\n', '\\', '"', get_code());
	return 0;
}
