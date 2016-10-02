#Amélioration possibles

Dans le livre "modern computer algebra" et dans les papier de Von Hoeij [@van2002factoring], il est mention d'une meilleure méthode
de combinaison des facteurs, la methode de reduciton par lattices.
Mais malheuresement cet algorithme n'est pas facilement implementable en moins de 3 mois pour manipuler des lattices efficacement.
Le gain de complexité est assez enomre et pourrait etre une des grosses amelioration de la factorisation dans Z.

Dans F_p, il serait possible d'ameliorer l'efficacité de la méthode de Zassenhaus en utilisant la a variation de Kaltofen et Shoup [@kaltofen1998subquadratic],
basé sur les methodes bisg-step/small-step qui consiste a diviser l'intervalle de decomposition en facteurs de meme degrees en plusisuers etapes.

