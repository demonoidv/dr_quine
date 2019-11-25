- L’exécutable se nomme Colleen.
- Lors de son exécution, le programme doit afficher sur la sortie standard un output
identique au code source du fichier utilisé pour compiler ce même programme.
- Le code source doit comporter au minimum :
	- Une fonction main.
	- Deux commentaires différents.
	- Un des commentaires doit être présent dans la fonction main.
	- Un des commentaires doit être présent en dehors des fonctions de votre programme.
	- Une fonction en plus de la fonction main principale (qui sera bien entendu
appelée)
Voici un exemple d’utilisation en C :
```sh
$> ls -al
total 12
drwxr-xr-x 2 root root 4096 Feb 2 13:26 .
drwxr-xr-x 4 root root 4096 Feb 2 13:26 ..
-rw-r--r-- 1 root root 647 Feb 2 13:26 Colleen.c
$> clang -Wall -Wextra -Werror -o Colleen Colleen.c; ./Colleen > tmp_Colleen ; diff tmp_Colleen
Colleen.c
$> _
```