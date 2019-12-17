# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vsporer <vsporer@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/09 11:29:41 by vsporer           #+#    #+#              #
#    Updated: 2019/12/17 11:30:21 by vsporer          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

C_OK =		\033[32m
C_DEL =		\033[31m
C_RESET =	\033[0m

CFLAGS =			-Wall -Werror -Wextra
CC =				gcc 

COLLEEN_SRC =		Colleen.c
GRACE_SRC =			Grace.c
SULLY_SRC =			Sully.c

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(COLLEEN_SRC)
	@echo "Compiling $@ ...\033[K"
	@$(CC) $(CFLAGS) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(GRACE): $(GRACE_SRC)
	@echo "Compiling $@ ...\033[K"
	@$(CC) $(CFLAGS) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(SULLY): $(SULLY_SRC)
	@echo "Compiling $@ ...\033[K"
	@$(CC) $(CFLAGS) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

clean:
	@rm -f Grace_kid.c Sully_*
	@echo "$(C_DEL)Directory cleaned up.$(C_RESET)"

fclean: clean
	@rm -f $(COLLEEN) $(GRACE) $(SULLY)
	@echo "$(C_DEL)$(COLLEEN), $(GRACE) and $(SULLY) removed.$(C_RESET)"

re: fclean all

.PHONY: all clean fclean re
