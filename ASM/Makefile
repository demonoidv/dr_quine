# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vsporer <vsporer@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/10 11:29:41 by vsporer           #+#    #+#              #
#    Updated: 2019/12/17 11:30:43 by vsporer          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLLEEN = 		Colleen
GRACE = 		Grace
SULLY = 		Sully

C_OK =			\033[32m
C_DEL =			\033[31m
C_RESET =		\033[0m

CC =			gcc
CFLAGS =		-Wall -Werror -Wextra

ASM =			nasm
ASMFLAGS =		-f macho64

COLLEEN_SRC =	Colleen.s
GRACE_SRC =		Grace.s
SULLY_SRC =		Sully.s

PATH_OBJ =		obj/

COLLEEN_OBJ =	$(patsubst %.s, $(PATH_OBJ)%.o, $(COLLEEN_SRC))
GRACE_OBJ =		$(patsubst %.s, $(PATH_OBJ)%.o, $(GRACE_SRC))
SULLY_OBJ =		$(patsubst %.s, $(PATH_OBJ)%.o, $(SULLY_SRC))

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(COLLEEN_OBJ)
	@echo "Linking $@ ..."
	@$(CC) $(CFLAGS) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(GRACE): $(GRACE_OBJ)
	@echo "Linking $@ ..."
	@$(CC) $(CFLAGS) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(SULLY): $(SULLY_OBJ)
	@echo "Linking $@ ..."
	@$(CC) $(CFLAGS) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(PATH_OBJ)%.o: %.s
	@echo "Compiling $@ ..."
	@mkdir -p $(PATH_OBJ)
	@$(ASM) $(ASMFLAGS) -o $@ $^

clean:
	@rm -rf $(PATH_OBJ) Grace_kid.s Sully_*
	@echo "$(C_DEL)Object files removed and directory cleaned up.$(C_RESET)"

fclean: clean
	@rm -f $(COLLEEN) $(GRACE) $(SULLY)
	@echo "$(C_DEL)$(COLLEEN), $(GRACE) and $(SULLY) removed.$(C_RESET)"

re: fclean all

.PHONY: all clean fclean re
