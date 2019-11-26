# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vsporer <vsporer@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/20 14:41:19 by vsporer           #+#    #+#              #
#    Updated: 2018/04/06 11:30:51 by vsporer          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

C_OK =		\033[32m
C_DEL =		\033[31m
C_RESET =	\033[0m

PATH_OBJ =			obj/

CC =				gcc -Wall -Werror -Wextra

COLLEEN_SRC =		Colleen.c
GRACE_SRC =			Grace.c
SULLY_SRC =			Sully.c

COLLEEN_OBJ =		$(patsubst %.c, $(PATH_OBJ)%.o, $(COLLEEN_SRC))
GRACE_OBJ =			$(patsubst %.c, $(PATH_OBJ)%.o, $(GRACE_SRC))
SULLY_OBJ =			$(patsubst %.c, $(PATH_OBJ)%.o, $(SULLY_SRC))

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(COLLEEN_OBJ)
	@echo "Compiling $@ ...\033[K"
	@$(CC) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(GRACE): $(GRACE_OBJ)
	@echo "Compiling $@ ...\033[K"
	@$(CC) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(SULLY): $(SULLY_OBJ)
	@echo "Compiling $@ ...\033[K"
	@$(CC) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(PATH_OBJ)%.o: %.c
	@echo "Compiling $@ ...\033[K"
	@mkdir -p $(@D)
	@$(CC) -c $< -o $@

clean:
	@rm -rf $(PATH_OBJ)
	@echo "$(C_DEL)Object files removed.$(C_RESET)"

fclean: clean
	@rm -f $(COLLEEN)
	@rm -f $(GRACE)
	@rm -f $(SULLY)
	@echo "$(C_DEL)$(COLLEEN), $(GRACE) and $(SULLY) removed.$(C_RESET)"

re: fclean all

.PHONY: clean fclean re
