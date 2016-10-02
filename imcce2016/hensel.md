## factorisation dans Z[x]
\label{sec:hensel}

Comme dit précedement, la factorisation d'un polynôme dans $\mathbb{Z}[x]$ fait intervenir la factorisation dans un corps fini
de caracteristique $p$, un premier. Cependant, le choix de p n'est pas arbitraire. Il faut choisir un $p$ de telle sorte qu'il
ne divise pas le coefficient dominant de f dans $\mathbb{F}_p[x]$ et que $f \mod p$ ne possède pas de facteurs multiples.
Nous devons aussi nous arranger pour que p reste le plus petit possible
étant donné que la complexité des algorithmes de factorisation dans un corps fini dépend de la complexité de la multiplication
de polynômes et que le nombre de multiplication dépend de p puisque nous élevons des polynômes à des puissances de p (cf. partie \ref{sec:modular}).

Nous allons calculer aussi une borne de Mignotte [@mignotte1983some] qui correspond à la norme maximale du produit des facteurs de f.
Autrement dit, il s'agit d'une borne sur la taille des coefficients des facteurs de f. Il est aussi interessant de noter que
c'est l'existence d'une borne sur les coefficients des facteurs de f qui permet de "remonter" un polynôme d'un corps fini vers
l'anneau des entiers.

Ensuite, nous pouvons utiliser la méthode de factorisation modulaire dans le corps $\mathbb{F}_p[x]$ et pouvoir obtenir une factorisation
de f.

Ensuite, il nous faut remonter les polynômes dans un corps de caracteristique $p^l$.
Pour cela, nous allons construire un arbre binaire des facteurs de f (voir figure \ref{fig:tree_gen}) et apliquer le lemme d'Hensel (lemme \ref{lem:hensel})
sur chacun des noeuds de l'arbre pour remonter les polynomes d'un corps de caracteristique q vers une caracteristique q^2.

\begin{figure}[h] \centering
	\input{res/tree_gen}
	\caption{Schémtisation d'un arbre de facteurs}
	\label{figure:tree_gen}
\end{figure}

\begin{lemma}
\label{lem:hensel}

Soit $f(x)$ un polynôme de $\mathbb{Z}[X]$ et $p$ un nombre premier. Soit $n$ un entier supérieur ou égal à 1. On suppose que l’on dispose d’un entier
$x$ tel que $f(x) \equiv 0 \mod p^n$ et $f'(x) \not\equiv 0 mod p$.
Alors il existe un entier $y \in \mathbb{Z}$ tel que $y \equiv x mod p^n$ et $f(y) \equiv 0 mod p^{2n}$.
De plus, cet entier est unique modulo $p^{2n}$. 
\end{lemma}

_Démonstration._ La preuve de ce lemme est disponible dans
[Algorithms for Computer Algebra @geddes1992algorithms, Partie 15.4, p.444] \hfill{\qedsymbol}

Une fois que nous avons relevé les facteurs dans un corps de caracterstique suffisement grande par répétition du lemme d'hensel sur l'arbre de facteurs,
nous pouvons tester la recombinaison des facteurs pour obtenir les véritables facteurs de f dans $\mathbb{Z}[x]$.

\input{res/hensel.tex}

\input{res/hensel_lift.tex}

\input{res/hensel_step.tex}

Cet algorithme a été tiré de Modern Computer Algebra [@von2013modern], Algorithme 15.19, p.427-428,

###Exemple
\label{ex:hensel}


Dans cet exemple, nous allons factoriser le polynôme $$f(x)=6x^4+5x^3+15x^2+5x+4 \in \mathbb{Z}[x]$$.
On calcule $A=\|f(x)\|_{\infty}=15$, $b=lc(f)=6$, $B=5^{1/2}2^4*15*6=3219.94$ et $\gamma=\lceil 2\log_2(C)\rceil = \lceil 2\log_2(5^8*3219.94^7)\rceil = 201$

On prends donc $p$ tels que $f(x)$ soit sans facteurs premiers, que $p$ ne divise pas $b$ et que $p$ soit le plus petit possible.
On choisit $p=5$, on a donc $$f_5(x) = x^4-1$$ qui est sans facteurs multiples, $gcd(x^4-1, 4x^3) = 0$
On calcule ensuite $l=\lceil log_p(2B+1)\rceil = \lceil log_5(6439.88) \rceil = 6$

Grace à la méthode de factorisation de la section \ref{sec:modular}, nous obtenons $$f_5(x)=1.(x-1)(x+1)(x-2)(x+2)$$

Nous pouvons donc écrire l'arbre des facteurs que l'on construit à partir des produits des facteurs modulo $p$, une partie des arbres de la remontée est

%finir l'exemple.%
