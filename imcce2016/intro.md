#Présentation

L'institut de mécanique céleste et de calcul des éphémérides (IMCCE) est chargé de la production et la publication des éphémérides officielles,
et mène des activités de recherche théoriques dans les domaines de la mécanique céleste, de la planétologie et
des mathématiques \footnote{\url{https://www.imcce.fr/langues/fr/index.html}}.

L'étude des systèmes dynamiques en astronomie, au cœur des activités de l'institut, fait intervenir des séries de perturbations
qu'il est impossible de traiter sans ordinateur. Le logiciel TRIP développé par Jacques Laskar et Mickaël Gastineau [@gastineau2011trip]
vise précisément la manipulation efficace de ces séries, que nous assimilerons ici à des polynômes. (TRIP est un système
de calcul formel interactif avec la possibilité d'écrire des scripts, à l'instar de Maple, avec lequel il est capable de communiquer.)

Trip a été développé originellement en FORTRAN et en C dans les année 1990 pour démontrer les théorie du comportement chaotique
du système solaire [@laskar1994large] [@laskar2009existence]. Le logiciel a été progressivement transcrit en c++, notamment depuis
2011 avec la norme c++11  et le nombrede nouvelles feature cools. Il est composé d'un grand nombre de modules différents [gros diagramme]
qui gèrent chacun des notionsd'algebre différentes comme par exemple matrices, séries, séries de Lie, vecteurs et, ce qui va nous
interesser dans ce rapport, les polynomes.

Les polyômes à coefficients dans C, R, Z sont en général représenté en mémoire sous la forme de séries par défaut étant donné
la syntaxe de trip et le fait que les astronomes utilisant TRIP utilse plus fréquement des opérations sur des séries que
des opérations sur des polynômes. Il existe néanmoins des types de polynome specifique. Il s'agit notamment des type t_upoldintmp
(polynome univarié dense a coefficient entier multiple precision), t_upolymodp (polynome univarié a coefficient entier modulo p
(coefficient dans un corps de cardinal p))et t_upoldmodopl (polynome univarié dense à coefficient entier dans un corps de cardinal p^n)
que nous utiliserons principalement.

La gestion des nombres dépends de leur type et de leur taille. Pour les petits entiers, les types de base du c++
(int, uint_16, unit_32, unit_64, ...) sont suffisant et disposent d'opérations optimisés fournient par le compilateur.
Pour les plus grands entiers et les réels, trip utilise des librairies numeriques multiple precision telles que GMP, MFC, MPFR, ...

C'est dans ce contexte complexe que j'entre en scene pour travailler sur l'implementation d'un algorithme de factorisation de polynomes
à coefficients entiers.


