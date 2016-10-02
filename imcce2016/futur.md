#Améliorations possibles

Dans le livre "modern computer algebra" et dans les papiers de Von Hoeij et W. Hart [@van2002factoring], il est mention d'une meilleure méthode
de combinaison des facteurs, la methode de réduction par lattices.
Mais malheuresement cet algorithme n'est pas facilement implementable en moins de 3 mois pour manipuler des lattices efficacement.
Le gain de complexité est assez énorme et pourrait être une des grosses améliorations de la factorisation dans $\mathbb{Z}[x]$.

Dans F_p, il serait possible d'ameliorer l'efficacité de la méthode de Zassenhaus en utilisant la variation de E. Kaltofen et V. Shoup [@kaltofen1998subquadratic],
basée sur les methodes bisg-step/small-step qui consiste à diviser l'intervalle de décomposition en facteurs de même degrés en plusiseurs étapes.

