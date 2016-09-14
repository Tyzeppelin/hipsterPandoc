#Implémentation et résultats

D'abord le code en trip (annexe) puis en c++.

En étudiant le temps que passe trip pour chaque instruction de la factorisation (AR) on peut se
rendre compte que la plus grosse partie du temps de la factorisation est sur 2 instructions :
"" et "". Et étant donné que l'élevation a une puissance d'un polynome se base sur la multiplication
de polynomes, c'est sur cette multiplication qu'il y a le plus de temps à gagner.

De base, les polynomes dans Z_p ne possédaient qu'une multiplication "naive", coefficient par coefficient.
Ensuite, Mickael Gastineau a travaillé a implementer des nouveaux algorithmes de multiplication. La premiere amelioration
a été d'implémenter la multiplication de Karatsuba qui a une complexite o(log(n)). A ce moment la, nous étions plus rapide que maple
pour factoriser des polynomes univarié dans un corps fini de caracteristique p. Ensuite nous avons comparé les resultats à FLINT qui utlise
une multiplication speciale qui fait usage de la multiplication de grands entier en format binaire de GMP. Avec cette multiplication,
nous sommes capable d'égaler FLINT sur le meme algorithme, mais sommes toujorus à la traine quand FLINT utilise la factorisation "maligne"
aka il choisit l'algorithme et les optimisation en fonction du degree du polynome et de la taille des coef.


