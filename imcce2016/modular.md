## Factorisation dans un corps fini
\label{sec:modular}

la factorisation des polynômes modulo un premier, autrement dit la factorisation des polynômes dans un corps fini
est un problème qui a été beaucoup
amelioré après la moitié du XXe siècle avec le développement des ordinateurs, et notamment des processeurs SPARC
au milieu des années 90. 

Dans le cadre de ce rapport nous n'allons étudier que l'algorithme de Cantor-Zassenhaus, qui se basent sur les deux
théorèmes suivants:

\begin{theorem}
\label{th:xp}
Le polynome $p(x) = x^{q^r} - x$ est le produit de tous les polynômes de $\mathbb{F}_q[x]$ dont le degré divise q.

\end{theorem}

_Démonstration._ La preuve de ce théorème est disponible dans [Finite Fields, @lidl1997finite, Theorem 3.20, p.90]
\hfill{\qedsymbol}

\begin{theorem}
\label{th:rand}
Soit $a(x)\in \mathbb{F}_p[x]$ un polynome de degré n composé de d facteurs de degré r, 
et $v(x)\in \mathbb{F}_p[x]$ un polynôme quelconque de degré inférieur à $2n+1$.

La probabilité que le pgcd de a(x) et $v(x)^{(q-1)/2} - 1$ soit différent de 1 est de
$$1 - {(q-1)/2q}^k - {(q+1)/2q}^k$$

Cette probabilité vaut au minimum 4/9
\end{theorem}

_Démonstration._ La preuve de ce théorème est disponible dans
[Algorithms for Computer Algebra @geddes1992algorithms, Théorème 8.11, p.362] \hfill{\qedsymbol}

La représentation schématique de la factorisation de polynômes modulo p est disponible en figure \ref{mod}

\input{res/mod.tex}

Pour obtenir un polynôme sans racines multiples et unitaire, on utilisera la méthode de Yun qui repose sur le principe que
si un polynôme possède des racines multiples, pgcd(f, f') != 1

### Séparation des facteurs de différentes multiplicités

\begin{definition}
\label{def:yun}
Soit f $\in \mathbb{Z}[x]$ un polyôme qui possède une factorisation unique dans le domaine $\mathbb{Z}[x]$. $f^{\star}(x)$ est dit sans racines multiples
s'il ne possède pas de facteurs qui se répète, de sorte qu'il n'existe aucun $h(x)$ avec $deg(h(x)) \geq 1$ tel que $h(x)^2$ ne divise pas $f^{\star}(x)$.
La factorisation sans facteurs multiples de f(x) est
$$f(x)=\prod_{i=1}^k f^{\star}_i(x)^i $$
ou chaque $f^{\star}_i(x)$ est un polynôme sans facteurs multiples et
$$gcd(f^{\star}_i(x), f^{\star}_j(x)) = 1 \; for \; i \neq j $$
\end{definition}


En utilisant la définition \ref{def:yun} il est possible d'établir la liste de tous les facteurs $f^{\star}_i(x)$ unitaires et sans racines multiples
d'un polynôme en appliquant des pgcd successifs, $f^{\star}_i(x)=gcd(f(x), f'(x))$. L'algorithme général de séparation des facteurs de différentes
multiplicités a été décrit par D. Yun [@yun1976square], nous allons utilisé la version présente dans _Algorithms for computer algebra_[@geddes1992algorithms], Algorithm 8.3, p.345.

\input{res/sff.tex}

#### Exemple

Prenons un polynôme $f(x) = x^6 - x^5 - 2x^3 + 2x^2 - x - 2 \in \mathbb{F}_5[x]$,
 $i=1$, $S = {}$ et $h(x) = f'(x) = x^5 - x^2 - x - 1$

On a $h(x) \neq 0$, donc on entre dans la branche else(ligne 8-20 ), on a
$$c(x) = gcd(f(x), h(x)) = gcd(x^6 - x^5 - 2x^3 + 2x^2 - x - 2, x^5 - x^2 - x - 1) = x^3 - 2x^2 + x - 2$$
et
$$w(x) = f(x) / c(x) = (x^6 - x^5 - 2x^3 + 2x^2 - x - 2)/(x^3 - 2x^2 + x - 2) = x^3 + x^2 + x + 1$$
Etant donné que $w(x) = x^3 + x^2 + x + 1$, nous entrons dans la boucle while,
On obtient $$y(x) = x^2 + 1\;\ et\;\ f^{\star}(x) = x + 1$$.
On a donc $f^{\star}(x)$ le(s) facteur(s) de multiplicité 1. On stocke donc $f^{\star}(x)$ et le retire des facteurs à factoriser.
$$S = S \cup \{(f^{\star}(x), i)\} = \{(x + 1, 1)\} \;\;et\;\; w(x) = x^2 + 1\;\; et\;\; c(x) = x - 2 $$

A l'itération suivante, $w(x) \neq 1$, 
$y(x) = x - 2$ et $f^{\star}(x) = x + 3$

On a donc,
$$S = \{(x+1, 1), (x+2, 2)\} \;\;et\;\; w(x) = x - 2$ et $c(x) =1$$

A la troisième itération, $w(x) \neq 1$,
$y(x) = 1$ et $f^{\star}(x) = x - 2$

On a donc
$$S = \{(x+1, 1), (x+2, 2), (x+3, 3)\} \;\; et \;\; w(x) = 1$  et $c(x) = 1$$

$w(x) = 1$ et $c(x) = 1$, donc nous nous arrêtons ici.

On retourne donc l'ensemble des facteurs de x de différentes multiplicités,
S = \{(x+1, 1), (x+2, 2), (x+3, 3)\}$


### Séparation en produit de facteurs de même degré

Le but de cette étape est de récupérer les produits de facteurs de $f^{\star}(x)$ de même degré, c'est à dire
les facteurs $h_i(x)$ tels que $f^{\star}(x)$ soit le produit des $h_i(x)$ et que le degré de $h_i(x)$ soit
égal à i.

Pour cela nous utilisons le théorème \ref{th:xp} et des pgcd successifs $gcd(f^{\star}(x), x^{p^i} \mod f^{\star}(x))$ pour 
$1 < i < deg(f^{\star}(x))/2$ 

L'algorithme que nous allons utilisé a été découvert par D. Cantor et H. Zassenhaus [@cantor1981new] et nous avons travaillé avec la version
de J. Von Zur Gathen de 2001 [@von2001factoring].

\input{res/dff.tex}

Pour bien comprendre le fonctionnement des deux algorithmes suivants, nous allons prendre un polynôme unitaire et sans racines
multiples que nous allons factoriser à l'aide de cet algorithme de factorisation en produit de facteurs de même degré
et de l'algorithme \ref{alg:eff} de séparation des facteurs qui sera décrit dans le chapitre \ref{chap:splitting}.

#### Exemple
\label{ex:dff}

Nous allons factoriser le polynôme $f^{\star}(x) = x^6-x^5-x^4-x^3-x^2-2$ définie dans $\mathbb{F}_5[x]$

Notons $i =1$, $S = \emptyset$ et $g^{\star}(x)=f^{\star}(x)$

On note que $deg(g^{\star}) = 6 \geq 2i = 2$, donc nous entrons dans la boucle.
On a
$$h(x) = gcd(g^{\star}(x), x^{p^i} - x \mod g^{\star}(x))
= gcd(x^6-x^5-x^4-x^3-x^2-2, -x^4-x^3-2x-2) = x^2-x-2$$

Puisque $h(x) \neq 1$, nous stockons $h(x)$, produit de facteurs irréductibles de f de degré 1.
$$S = S \cup \{(h(x), i)\} = \{(x^2-x-2, 1)\}$$
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

Pour séparer les différents facteurs de même degré, nous allons utiliser un algorithme dit de Las Vegas dans le sens
où il renvoie un résultat juste mais avec un temps variable, à la difference des algorithmes de Monte-Carlo qui donne un résultat assez proche mais dans
un intervalle de temps constant. Un des meilleurs exemple d'algorithme de Las Vegas est le Quicksort à pivot aléatoire, dont le temps d'execution dépend
du pivot et où le résultat est retourné est juste.

La méthode théorique pour la séparation de facteur à été formalisé par D. Cantor et H. Zassenhaus [Cantor91On], elle consiste
à tirer un polynôme aléatoire $v(x)$ et à l'elever à une puissance définie, $(p^n-1)/2$. La probabilité moyenne que le polynôme h(x) est un facteur
commun avec $v(x)$ est donné par le théroème \ref{th:rand} comme étant proche de 1/2.

Nous utiliserons la variation de K. Geddes décrite dans 
Algorithms for Computer Algebra [@geddes1992algorithms], Algorithme 8.9, p.373

\input{res/eff.tex}

#### Exemple

Nous reprenons notre exemple de la partie précédente \ref{ex:dff} où nous avions
$f^{\star}(x) = h_1(x)*h_2(x)$ avec $h_1(x) = x^2-x-2$ produit de facteurs de degré n = 1
et $h_2(x) = x^4+x^2+1$ produit de facteurs de degré n = 2.

Nous allons commencer par séparer les facteurs de $h_1(x)$ qui sont de degré n = 1
On pose $m = deg(h_1(x))/n = 2$ et $S = {h_1(x)}$.

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

On prend un polynôme aléatoire de degré inférieur ou égal à 3, $v(x) = x^3 + 1$
On a donc $v(x) = (x^3+1)^12-1 = x^36+2x^33+x^30+2x^21-x^18+2x^15+x^6+2x^3$
$g(x) = gcd(f_2(x), v(x)) = x^2+x+1$
On a donc $g(x)=x^2+x+1$ de degré 2 et $f_2(x)/g(x) = x^2-x+1$ de degré 2 aussi.

Au final on a donc $f_2(x)=(x^2+x+1)(x^2-x+1)$

On a donc factorisé $$f(x)=x^6-x^5-x^4-x^3-x^2-2 = (x+1)(x-2)(x^2+x+1)(x^2-x+1)$ dans $\mathbb{F}_5$$

