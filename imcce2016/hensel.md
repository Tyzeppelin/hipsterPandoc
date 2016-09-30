## factorisation dans Z[x]
\label{sec:hensel}

Comme dit précedement, la factorisation d'un polynôme dans $\mathbb{Z}[x]$ fait intervenir la factorisation dans un corps fini
de caracteristique p, un premier. Cependant, le choix de p n'est pas arbitraire. Il faut choisir un p de telle sorte que
p ne divise pas le coefficient dominant de f
dans $\mathbb{F}_p[x]$ et que $f \mod p$ ne possède pas de facteurs multiples.
Nous devons aussi nous arranger pour que p reste le plus petit possible
étant donnée que la complexité des algorithmes de factorisation dans un corps fini dépends de la complexité de la multiplication
de polynômes et que le nombre de multiplication dépends de p puisque nous élevons des polynômes à des puissances de p (cf. partie \ref{sec:modular}).

Nous allons calculer aussi une borne de Mignotte [@mignotte1983some] qui correspond à la norme maximal du produit des facteurs de f.
Autrement dit, il s'agit d'une borne sur la taille des coefficients des facteurs de f. Il est aussi interessant de noter que
c'est l'existence d'une borne sur les coefficients des facteurs de f qui permet de "remonter" un polynôme d'un corps fini vers
l'anneau des entiers.

Ensuite nous pouvons utiliser la méthode de factorisation modulaire dans le corps $\mathbb{F}_p[x]$ et pouvoir obtenir une factorisation
de f.

Ensuite il nous faut remonter les polynômes dans un corps de caracteristique $p^l$.
Pour cela nous allons construire un arbre binaire des facteurs de f (voir exemple) et apliquer le lemme d'Hensel sur chacun des noeuds de l'arbre pour remonter
les polynomes d'un corps de caracteristique q vers une caracteristique q^2.

Une fois que nous avons relever les facteurs dans un corps de caracterstique suffisement grande, nous pouvons tester la recombinaison des facteurs
pour obtenir les véritables facteurs de f dans $\mathbb{Z}[x]$.

\input{res/hensel.tex}
\input{res/hensel_lift.tex}
\input{res/hensel_step.tex}

Cet algorithme a été tiré de Modern Computer Algebra [@von2013modern], Algorithme 15.19, p.427-428,

###Exemple

TODO
