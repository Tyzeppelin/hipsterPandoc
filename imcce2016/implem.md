#Implémentation et résultats

## TRIP

La première partie de l'implémentation aura été en langage TRIP [@GL14]. Cette implémentation aura eu l'intérêt de
déterminer le nombres de fonctions nécessaires à l'implémentation. Par exemple la fonction d'élévation à
une puissance n'était pas disponible pour les polynômes dans $\mathbb{F_p}[x]$.

En plus de faire le tour des fonctionnalité de TRIP, cette implémentation aura aussi permis de faire des choix sur les
différentes implémentations possibles. Par exemple, l'algorithme de recomposition basé sur les lattice aurait été trop
compliqué et trop long à complétement implementer et tester.

%input le code trip en annexe (trouver un bon moyen de le rendre)

## C++

La seconde partie du développement aura été l'implémentation et les tests en c++. Comme dit précédemment, j'avais déjà des
cas de tests grace à la première implémentation en TRIP. Il a simplement fallu que je traduise l'algorithme correctement
en prenant en compte les spécificités du c++.

la première partie que j'ai implementé aura été la factorisation dans un corps fini puisque c'est un des élément de la
factorisation globale. J'ai donc implémenté cette partie et nous avons pu comparer notre début d'implémentation aux
différents autres logiciels/bibliothèques de calcul formel (par exemple maple et FLINT). On obtient ce graphe du ratio
temps de TRIP sur temps de maple en fonction du degré du polynôme a factoriser.

%mettre le gnuplot%

En étudiant le temps que passe trip pour chaque instruction de la factorisation on peut se
rendre compte que la plus grosse partie du temps de la factorisation est sur 2 instructions d'élévation
d'un polynome a une puissance. Et étant donné que l'élevation a une puissance d'un polynome se base sur la multiplication
de polynomes, c'est sur cette multiplication qu'il y avait le plus de temps à gagner.

De base, les polynomes dans Z_p ne possédaient qu'une multiplication "naive", coefficient par coefficient.
Ensuite, Mickael Gastineau a travaillé a implementer des nouveaux algorithmes de multiplication. La premiere amelioration
a été d'implémenter la multiplication de Karatsuba[@thome2002karatsuba]. A ce moment la, nous étions plus rapide que maple %graphe%
pour factoriser des polynomes univarié dans un corps fini de caracteristique p. Par contre nous étions toujours loin de FLINT qui utlise
une multiplication speciale qui fait usage de la multiplication de grands entier en format binaire de GMP [@schonhage1971schnelle].
Avec cette multiplication, nous sommes capable d'égaler FLINT sur le meme algorithme, mais sommes toujours à la traine quand FLINT
utilise la factorisation "maligne", autrement dit quand il choisit l'algorithme et les optimisation en fonction du degree du polynome
et de la taille des coef.


