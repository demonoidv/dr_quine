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

LD =			ld

ASM =			nasm
ASMFLAGS =		-f macho64

COLLEEN_SRC =	Colleen.s
GRACE_SRC =		Grace.s
SULLY_SRC =		Sully.s

PATH_OBJ =		obj/

COLLEEN_OBJ =	$(patsubst $(PATH_OBJ)%.o, %.s, $(COLLEEN_SRC))
GRACE_OBJ =		$(patsubst $(PATH_OBJ)%.o, %.s, $(GRACE_SRC))
SULLY_OBJ =		$(patsubst $(PATH_OBJ)%.o, %.s, $(SULLY_SRC))

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(COLLEEN_OBJ)
	@echo "Linking $@ ..."
	@$(LD) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(GRACE): $(GRACE_OBJ)
	@echo "Linking $@ ..."
	@$(LD) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(SULLY): $(SULLY_OBJ)
	@echo "Linking $@ ..."
	@$(LD) $^ -o $@
	@echo "$(C_OK)Done !$(C_RESET)"

$(PATH_OBJ)%.o: %.s
	@echo "Compiling $@ ..."
	@$(ASM) $(ASMFLAGS) -o $@ $^

clean:
	@rm -rf $(PATH_OBJ) Grace_kid.s Sully_*
	@echo "$(C_DEL)Object files removed and directory cleaned up.$(C_RESET)"

fclean: clean
	@rm -f $(COLLEEN) $(GRACE) $(SULLY)
	@echo "$(C_DEL)$(COLLEEN), $(GRACE) and $(SULLY) removed.$(C_RESET)"

re: fclean all

.PHONY: all clean fclean re
