- L’exécutable se nomme Grace.
- Lors de son exécution, le programme écrit dans un fichier nommé Grace_kid.c/Grace_kid.s
le code source du fichier utilisé pour compiler ce même programme.
- Le code source doit comporter strictement :
	- Aucun main déclaré.
	- Strictement trois defines.
	- Un seul commentaire.
- Le programme se lancera à l’appel d’une macro.
Voici un exemple d’utilisation en C :
```sh
$> ls -al
total 12
drwxr-xr-x 2 root root 4096 Feb 2 13:30 .
drwxr-xr-x 4 root root 4096 Feb 2 13:29 ..
-rw-r--r-- 1 root root 362 Feb 2 13:30 Grace.c
$> clang -Wall -Wextra -Werror -o Grace Grace.c; ./Grace ; diff Grace.c Grace_kid.c
$> ls -al
total 24
drwxr-xr-x 2 root root 4096 Feb 2 13:30 .
drwxr-xr-x 4 root root 4096 Feb 2 13:29 ..
-rwxr-xr-x 1 root root 7240 Feb 2 13:30 Grace
-rw-r--r-- 1 root root 362 Feb 2 13:30 Grace.c
-rw-r--r-- 1 root root 362 Feb 2 13:30 Grace_kid.c
$> _
```