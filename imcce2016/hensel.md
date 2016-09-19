
## factorisation in Z[x]
\label{sec:hensel}


Comme dit précedement, la factorisatino d'un polynôme dans $\mathbb{Z}[x]$ fait intervenir la factorisation dans un corps finis
de caracteritique p, un premier. Le choix de p n'est pas arbitraire cependant, il faut choisir un p pour lequel l'homomorphisme
de $\mathbb{Z}[x]$ dans $\mathbb{F}_p[x]$ soit possible (?bijectif?). C'est à dire que l'on ne perdre pas d'information.

Pour cela nous cherchons un p qui ne divise pas le coefficient principale (aka le coefficient de plus haut degré) de f et
qui fait en sort que f soit (reste) sans facteurs multiples. Nous devons aussi nous arranger pour que p reste le plus petit possible
étant donnée que la complexité des algorithmes de factorisation dans $\mathbb{F}_p[x]$ dépends de la complexité de la multiplication
de polynçomes et que le noombre de multiplication dépends de p (nous allons élever des polynômes à des puissances de p).

Nous allons calculer aussi une borne de Mignotte [ref mignotte], qui correspond au produit maximum des coefficients de f. (plus ou moins)

Ensuite nous pouvons utiliser la méthode de factorisation modulaire dans le corps $\mathbb{F}_p[x]$ et pouvoir obtenir une factorisation
de f.

Ensuite il nous faut remonter les polynômes dans un corp de caracteristique p^l plus grande que les potentiels coefficients des facteurs de f.
Pour cela nous allons construire un arbre binaire des facteurs de f et apliquer le lemme d'Hensel sur chacun des noeuds de l'arbre pour remonter
les polynomes d'un corps de caracteristique q vers une caracteristique q^2.

Une fois que nous avons relever les facteurs dans un corps de caracterstique suffisement grande, nous pouvons tester la recombinaison des facteurs
pour obtenir les véritables facteurs de f dans $\mathbb{Z}[x]$.

\input{res/hensel.tex}

Cet algorithme a été tiré de modern computer algebra (Von Zur Gathen et al.1997)

###Exemple

TODO

