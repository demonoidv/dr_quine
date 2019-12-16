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

COLLEEN = 		Colleen
GRACE = 		Grace
SULLY = 		Sully

C_OK =			\033[32m
C_DEL =			\033[31m
C_RESET =		\033[0m

CC =			rustc

COLLEEN_SRC =	Colleen.rs
GRACE_SRC =		Grace.rs
SULLY_SRC =		Sully.rs

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(COLLEEN_SRC)
	@echo "Compile $@ ..."
	@$(CC) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(GRACE): $(GRACE_SRC)
	@echo "Compile $@ ..."
	@$(CC) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(SULLY): $(SULLY_SRC)
	@echo "Compile $@ ..."
	@$(CC) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

clean:
	@rm -f Grace_kid.s Sully_*
	@echo "$(C_DEL)Directory cleaned up.$(C_RESET)"

fclean: clean
	@rm -f $(COLLEEN) $(GRACE) $(SULLY)
	@echo "$(C_DEL)$(COLLEEN), $(GRACE) and $(SULLY) removed.$(C_RESET)"

re: fclean all

.PHONY: all clean fclean re
