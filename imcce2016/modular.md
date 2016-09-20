## Factorisation dans un corps fini
\label{sec:modular}

la factorisation des polynômes modulo un premier aka factorisation de polynomes dans un coprs fini (p-adiques en vrai mais osef un peu, mais pas vraiment, mais si...)
est un problème relativement qui a commencé a être étudié par Gauss (je dois me gourer) et qui a été beaucoup amelioré après la moitié du XXe siècle avec le développement des ordinateurs,
et notamment des processeurs sparc au milieu des années 90. Les principales avancés dans la factorisation sont du à Berlekamp, Zassenhaus, Cantor, Von Zur Gathen, Shoup, Geddes(?).

Les principales méthodes de factorisation se séparent en 2 idées. La première, communement appelé algorithme de Berlekamp (avec la variante des grands premier) [voir article]
La seconde méthode, celle que nous développerons est la méthode de Zassenhaus qui se base sur deux théorème:

\begin{theorem}
\label{th:xp}
Le polynome $p(x) = x^{q^r} - x$ est le produit de tous les polynômes de _$\mathbb{F}_q[x]$ dont le degré divise q.
}

\begin{proof}
La preuve de ce théorème est disponible dans [Finite Fields, @lidl1997FiniteFields, Theorem 3.20, p.90]
\end{proof}

\begin{theorem}
\label{th:rand}
Soit $a(x)\in \mathbb{F}_p[x]$ un polynome de degré n composé de d facteurs de degré r, 
et $v(x)\in \mathbb{F}_p[x]$ un polynôme quelconque de degré inférieur à $2n+1$.

La probabilité que le pgcd de a(x) et $v(x)^{(q-1)/2} - 1$ soit différent de 1 est de
$$1 - {(q-1)/2q}^k - {(q+1)/2q}^k$$

Cette probabilité vaut au minimum 4/9
\end{theorem}

\begin{proof}
Cette preuve est disponible dans [Algorithms for Computer Algebra @geddes1992algorithms, Théorème 8.11, p.362]
\end{proof}

Nous allons nous interesser à la méthode dite de Cantor-Zassenhaus [@cantor1981new]
pour factoriser un polynome squarefree et dont le coefficient dominant est 1.

Pour obtenir un polynômes sans racines multiples et unitaire, on utilisera la méthode de Yun qui repose sur le principe que
si un polynoem possède des racines multiples, on remarque que pgcd(f, f') != 0

### Séparation des facteurs de différentes multiplicités

\begin{definition}
Soit f $\in$ Z[x] un polyôme qui possède une factorisation unique dans le domaine Z. f(x) est dit sans racines multiples (trouver un synonyme)
s'il ne possède pas de facteurs qui se répète, tel qu'il n'existe aucun $h(x)$ avec $deg(h(x)) \geq 1$ tel que $h(x)^2$ ne divise pas $f(x)$.
La factorisation sans facteurs multiples de f(x) est
$$f(x)=\prod_{i=1}^k a_i(x)^i $$
ou chaque $a_i(x)$ est un polynôme sans facteurs multiples et
$$gcd(a_i(x), a_j(x)) = 1 \; for \; i \neq j $$
\end{definition}

Du coup on obtient la liste des polynomes squarefree et leur multiplicité et chaque polynome est squarefree et unitaire.

Ensuite, pour chaque polynome squarefree/unitaire, nous utilisons la définition, en appliquant, pour tout i entre 1 et deg(f)/2

On peut formaliser et on obtient l'algorithme suivant (ici nous reprenons le modele de [Algorithms for computer algebra, @geddes1992algorithms, Algorithm 8.3, p.345 ])

\input{res/sff.tex}

#### Exemple

Prenons un polynôme $f(x) = x^6 - x^5 - 2x^3 + 2x^2 - x - 2 \in \mathbb{F}_5[x]$
avec $i=1$, $out(x) = 1$ et $h(x) = f'(x) = x^5 - x^2 - x - 1$

On a $h(x) \neq 0$, donc on entre dans le else de la condition, on a
$$c(x) = gcd(f(x), h(x)) = gcd(x^6 - x^5 - 2x^3 + 2x^2 - x - 2, x^5 - x^2 - x - 1) = x^3 - 2x^2 + x - 2$$
et
$$w(x) = f(x) / c(x) = (x^6 - x^5 - 2x^3 + 2x^2 - x - 2)/(x^3 - 2x^2 + x - 2) = x^3 + x^2 + x + 1$$
Etant donné que $w(x) = x^3 + x^2 + x + 1$, nous entrons dans la boucle,
On obtient $$y(x) = x^2 + 1$$ et $$z(x) = x + 1$$.
On a donc z(x) le(s) facteur(s) de multiplicité 1. On stocke donc z(x) et le retire des facteurs à factoriser.
$$out(x) = out(x)z(x)^i = (x + 1)^1 \;et\; w(x) = x^2 + 1$$ et $$c(x) = x - 2$$

Au tour de boucle suivant , $w(x) \neq 1$
$y(x) = x - 2$ et $z(x) = x + 3$
On a donc,
$out(x) = (x+1)^1*(x+2)^2$
$w(x) = x - 2$ et $c(x) =1$

Au troisième tour de boucle, $w(x) \neq 1$,
$y(x) = 1$ et $z(x) = x - 2$
On a donc
$out(x) = (x+1)(x+2)^2(x+3)^3$
$w(x) = 1$  et $c(x) = 1$

On a donc $w(x) = 1$, la boucle s'arrète donc ici. Et puisque $c(x) = 1$.

On retourne donc le polynôme f(x) factorisé en produit de facteurs de multiplicité propre,
f(x) = out(x) = (x+1)(x+2)^2(x+3)^3$


### Séparation en produit de facteurs de même degré

A l'issu de cet algortihme nous récupérons les n produits de facteurs g de f de degré d tels que 

$f = Prduit (i = 1 -> n) g_i avec deg(g_i) = d_i, 1 < d_i < deg(f)/2$

Pour cela ous utilisons le théorème \ref{th:xp} :

\input{res/dff.tex}

Cet algorithme est basé sur l'algorithme n de [@von2001factoring]

Pour bien comprendre le fonctionnement des deux algorithmes algorithmes suivant, nous allons prendre un polynôme unitaire et sans racines
multiples que nous allons factoriser à l'aide de cet algorithme de factorisation en produit de facteurs de même degré
et de l'algorithme  \ref{alg:eff} de séparation des facteurs.

#### Exemple
\label{ex:dff}

Nous allons factoriser le polynôme $f(x) = x^6-x^5-x^4-x^3-x^2-2$ définie dans $\mathbb{F}_5[x]$

Notons $i =1$, $S = \emptyset$ et $f*(x)=f(x)$

On note que $deg(f*(x)) = 6 \geq 2i = 2$, donc nous entrons dans la boucle.
On a
$$g(x) = gcd(f*(x), x^{p^i} - x \mod f*(x)) = gcd(x^6-x^5-x^4-x^3-x^2-2, x^5-x \mod x^6-x^5-x^4-x^3-x^2-2)\\
= gcd(x^6-x^5-x^4-x^3-x^2-2, -x^4-x^3-2x-2) = x^2-x-2$$
Puisque $g(x) \neq 1$, nous stockons g, produit de facteurs irréductibles de f de degré 1.
$$S = S \cup {(g(x), i} = \{(x^2-x-2, 1)\}$$
$f*(x)=f(x)*/g(x) = x^4+x^2+1$

Au deuxième tour de boucle, $deg(f(x)) = 4$ et $2i = 4$. On retourne donc dans la boucle,
On calcule
$g(x) = gcd(x^4+x^2+1, x^25-x \mod x^4+x^2+1) = x^4+x^2+1$
et donc,
$$S = S \cup \{(g(x), i)\} = \{(x^2-x-2, 1), (x^4+x^2+1, 2)\}$$

A la fin, $f*(x) = 1$, On sort donc de la boucle et on n'entre pas dans la dernière condition.

On obtient donc la séparation en facteurs irréductibles de même degré suivante $$S = \{(x^2-x-2, 1), (x^4+x^2+1, 2)\}$$


### Séparation des facteurs de même degrés
\label{chap:splitting}

Pour séparer les différents facteurs de même degrés, nous allons utiliser un algorithme dit de Las Vegas dans le sens
où il renvoie un résultat juste mais avec un temps variable, à la difference des algorithmes de Monte-Carlo qui donne un résultat assez proche mais dans
un intervalle de temps constant. Un des meilleurs exemple d'algorithme de Las Vegas est la Quicksort à pivot aléatoire, dont le temps d'execution dépends
du pivot et où le résultat est retourné est juste.

La méthode théorique pour la séparation de facteur à été formalisé par Cantor et Zassenhaus [Cantor91On], elle consiste
à tirer des polynômes aléatoires et à l'elever à une puissance définie. La probabilité de trouver un facteur en commun
est calculé dans le théorème \ref{th:rand}.

On obtient l'algorithme de separationsdes facteurs de meme degrés, nous utiliserons la version de
[Algorithms for Computer Algebra @geddes1992algorithms, Algorithme 8.9, p.373]

\input{res/eff.tex}

#### Exemple

Nous reprennons notre exemple de la partie précédente \ref{ex:dff} ou nous avions
$f(x) = f_1(x)*f_2(x)$ avec $f_1(x) = x^2-x-2$ produit de facteurs de degré n = 1
et $f_2(x) = x^4+x^2+1$ produit de facteurs de degré n = 2.

Nous allons commencer par séparer les facteurs de $f_1(x)$ qui sont de degré n = 1
On pose $m = deg(f_1(x))/n = 2$ et $S = {f_1(x)}$.

Puisque la taille de S est inférieure à m, on entre dans la boucle.
On prends un polynome aléatoire de degré inférieur ou égal à 1, $v(x) = x$
On a $v(x) = v(x)^{(q^n-1)/2}-1 = x^2 - 1$
$$g(x) = gcd(x^2-x-2, x^2-1) = x+1$$
Puisque $g(x) \neq 1$ et $g(x) \neq f_1(x)$,
On a $$S = equal\_degree\_splitting(x+1, 1) \cup equal\_degree\_splitting(x-2, 1)$$
On notera que $deg(x+1) = 1$, ce qui veut dire que $x+1$ est un facteur irréductible de $f_1(x)$ de degré 1.
Il en va de même pour $x+2$.

On a donc séparer les facteurs irréductibles de $f_1(x) = (x+1)(x-2)$

La méthode est la même pour $f_2(x) = x^4+x^2+1$,

On prends un polynôme aléatoire de degré inférieur ou égal à 3, $v(x) = x^3 + 1$
On a donc $v(x) = (x^3+1)^12-1 = x^36+2x^33+x^30+2x^21-x^18+2x^15+x^6+2x^3$
$g(x) = gcd(f_2(x), v(x)) = x^2+x+1$
On a donc $g(x)=x^2+x+1$ de degré 2 et $f_2(x)/g(x) = x^2-x+1$ de degré 2 aussi.

Au final on a donc $f_2(x)=(x^2+x+1)(x^2-x+1)$

On a donc factorisé $$f(x)=x^6-x^5-x^4-x^3-x^2-2 = (x+1)(x-2)(x^2+x+1)(x^2-x+1)$ dans $\mathbb{F}_5$$

