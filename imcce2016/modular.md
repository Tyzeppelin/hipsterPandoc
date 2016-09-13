### modular factorization

la factorisation des polynômes modulo un premier aka factorisation de polynomes dans un coprs fini (p-adiques en vrai mais osef un peu, mais pas vraiment, mais si...)
est un problème relativement qui a commencé a être étudié par Gauss (je dois me gourer) et qui a été beaucoup amelioré après la moitié du XXe siècle avec le développement des ordinateurs,
et notamment des processeurs sparc au milieu des années 90. Les principales avancés dans la factorisation sont du à Berlekamp, Zassenhaus, Cantor, Von Zur Gathen, Shoup, Geddes(?).

Les principales méthodes de factorisation se séparent en 2 idées. La première, communement appelé algorithme de Berlekamp (avec la variante des grands premier) [voir article]
La seconde méthode, celle que nous développerons est la méthode de Zassenhaus qui se base sur deux théorème:

Théorème 1:
Le polynome p(x) = x ^ q ^ r est le produit de tous les polynômes de F_q[x] dont le degré divise q.

Proof annexe n

Théorème 2:
Soit a(x) un polynome composé de d facteurs de degré r, et v(x) un polynôme quelconque, q impair
La probabilité que le pgcd de a(x) et v(x)^{(q-1)/2} - 1 soit différent de 1 est de 
1 - {(q-1)/2q}^k - {(q+1)/2q}^k

Cette probabilité vaut au minimum 4/9

Proof annexe n+1

Nous allons nous interesser à la méthode dite de Cantor-Zassenhaus [ref A new algorithm for factoring polynomials over finite fieldds 1981]
pour factoriser un polynome squarefree et dont le leading coefficient est 1.

Pour obtenir un polynômes sans racines multiples et unitaire, on utilisera la méthode de Yun qui repose sur le principe que
si un polynoem possède des racines multiples, on remarque que pgcd(f, f') != 0

%Algo de Yun%

Du coup on obtient la liste des polynomes squarefree et leur multiplicité. Chaque polynome est squarefree et unitaire.

Ensuite, pour chaque polynome squarefree/unitaire, nous utilisons le Theroeme 1, en appliquant, pour tout i entre 1 et deg(f)/2

On peut formaliser et on obtient l'algorithme DFF (ici nous reprenons le modele de [ref])

%Algo DFF%

A l'issu de cet algortihme nous avons récupéré les n produits de facteurs g de f de degré d tels que 

f = Prduit (i = 1 -> n) g_i avec deg(g_i) = d_i, 1 < d_i < deg(f)/2

Pour séparer les différents facteurs de même degrés, nous allons utiliser un algorithme dit de Las Vegas dans le sens où il renvoie un résultat juste mais avec un temps
variable, à la difference des algorithmes de Monte-Carlo qui donne un résultat assez proche mais dans un intervalle de temps constant.
Un des meilleurs exemple d'algorithme de Las Vegas est la Quicksort à pivot aléatoire, dont le temps d'execution dépends du pivot et où le résultat est retourné est juste.
La méthode théorique pour la séparation de facteur à été formalisé par Cantor et Zassenhaus, elle consiste a tirer des polynômes aléatoires et à l'elever à une puissance
définie (q-1/2). On obtient l'algorithme de separations des facteurs de meme degrés (EFF)

%Algo EFF%


