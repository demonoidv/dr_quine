#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

int	main(void)
{
	int		i = 5;
	FILE	*handle;
	char	compile[128];
	char	name[64];
	char	src[64];
	char	*code = "#include <stdlib.h>%1$c#include <stdio.h>%1$c#include <string.h>%1$c#include <unistd.h>%1$c%1$cint	main(void)%1$c{%1$c	int		i = %6$d;%1$c	FILE	*handle;%1$c	char	compile[128];%1$c	char	name[64];%1$c	char	src[64];%1$c	char	*code = %3$c%5$s%3$c;%1$c	char	*args[2] = {name, NULL};%1$c	if (strcmp(__FILE__, %3$cSully.c%3$c))%1$c	{%1$c		if (i <= 0)%1$c			return 0;%1$c		i--;%1$c	}%1$c	snprintf(name, 64, %3$cSully_%4$cd%3$c, i);%1$c	snprintf(src, 64, %3$cSully_%4$cd.c%3$c, i);%1$c	snprintf(compile, 128, %3$c/usr/bin/gcc -Wall -Werror -Wextra -o %4$cs %4$cs%3$c, name, src);%1$c	handle = fopen(src, %3$cw%3$c); %1$c	if (!handle)%1$c		return -1;%1$c	fprintf(handle, code, '%2$cn', '%2$c%2$c', '%3$c', '%4$c', code, i);%1$c	fclose(handle);%1$c	system(compile);%1$c	execv(name, args);%1$c	return -1;%1$c}%1$c";
	char	*args[2] = {name, NULL};
	if (strcmp(__FILE__, "Sully.c"))
	{
		if (i <= 0)
			return 0;
		i--;
	}
	snprintf(name, 64, "Sully_%d", i);
	snprintf(src, 64, "Sully_%d.c", i);
	snprintf(compile, 128, "/usr/bin/gcc -Wall -Werror -Wextra -o %s %s", name, src);
	handle = fopen(src, "w"); 
	if (!handle)
		return -1;
	fprintf(handle, code, '\n', '\\', '"', '%', code, i);
	fclose(handle);
	system(compile);
	execv(name, args);
	return -1;
}
