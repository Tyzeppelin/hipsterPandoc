# Algorithmes de factorisation

La factorisation des polyômes est un problème complexe dont la complexité varie surtout selon le nombres d'indeterminés
du plynôme et le domaine des coefficients.

Nous allons nous interesser uniquement aux polynômes uinvariés, cad à une seule indeterminée, dont les coefficients
se trouvent dans le corps des entiers, noté Z.

La factorisation dans R consiste a trouver les racines du polynomes et il existe plusieurs algorithmes différents pour
y arriver (Newton, ... [rajouter des references]), dans C l factorisatino est "plus simple" vu que l'on connait
"à l'avance" le nombre de facteurs vu que le degré du polynome est égal au nombre de ses facteurs.

Nous allons, dans le cadre de mon stage, nous interesser à la factorisatoin de polynômes à coefficients dans le corps des entiers Z.

La factorisation dans Z n'est pas facile et il est beaucoup plus facile de factoriser un polynome dans Q, les algorithmes
les plus efficaces ont le meme principe :

On prends un polynome f dans Z[x] et un premier p dans Z de telle sorte qu'il ne divise pas f que f soit squarefree dans Zp.
Ensuite on a deux méthodes différentes pour factoriser le polynome dans Zp, une methode ou on factorise dans un corps
avec une tres grande caracteristique (autrement dit factoriser dasn Zp avec p> borne de Mignotte); la seconde méthode
consiste a factoriser un polynome dans Zp avec p le plus petit possible et à "remonter" les facteurs dans Zp^l grace au lemme d'Hensel.

Une fois que l'on possède tous les facteurs de f* dans Zp il faut trouver quelles combinaisons de ces facteurs
forment les facteurs dans Z. Pour cela il y a aussi deux algorithmes différents. Un qui consiste a tester toutes
les combinaisons de facteurs. Cette méthode possède un désaventage évident: la complexité de cet algorithme est
exponentiel dans le pire des cas. (et il n'est pas loin d'etre exponentiel en moyenne) La seconde méthode, beaucoup plus récente,
se base sur les travaux de réductions en lattice de LLL. Cet algorithme a une complexité polynomiale en théorie
meme si en pratique il reste moins efficcace que la combinaison de facteurs pour un "petit" nomre de facteurs.
Il fait appel a des théories mathématiques plus récentes et plus complexes et ne sera pas étudié ici.

Nous avons donc:

\input{res/ho.tex}


Nous avons décidé, dans un premier temps, de travailler avec les méthodes "prime power" pour la factorisation dans
un corps (p-adique) finis (Galois) puisque cette méthode nous permet de ne pas travailler avec des polynomes trop important
et aussi parceque c'est la plus rapide et qu'elle est "plus simple" à implementer. Basiquement Berlekamp(matrice, ...)
VS Zassenhaus (random, ...). Pour la remonté dans Z[x] nous avons opté pour la méthode combinatoire, la manipulation
de lattice n'étant pas prévu par TRIP et une structure de donnée faite à la va-vite c'est pas cool.

Donc pour résumer nous allons avoir un algo qui ressemble à ça :
(Modern Computer Algebra, Algo de Von Zur Gathen et al. 15.6)

- On rends le polynome squarefree

- calcul des différentes bornes, constantes nécessaires,
    (notamment B, p, l)

- factorisation dans Zp

- remonté des facteurs en arbre (?) dans Zp^l

- combinaison des facteurs de Zp^l

- profit

%expliquer les diferents algo%

%On a l'algo de Yun pour retirer les racines multiples, 
%Ensuite factorisation dans Zp en suivant zassenhaus
%suivis par euclide etendu qui permet de faire un arbre de facteurs ('fin pas vraiment mais bon (dans l'idée c'est comme ca (theoriquement))) 
%Ensuite on applique Hensel sur chaque sou-arbre pour élever les facteurs dans Zp^l avec l sufisement grand (basiquemet p^l ~ borne de mignotte)
%Et pour finir on test la combinaison de tous les facteurs dans Zp^l. Lorsque le produit des normes ||combinaison||_1 * ||reste des facteurs||_1
%est inferieur a Mignotte.


