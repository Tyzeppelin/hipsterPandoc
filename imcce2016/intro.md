#Présentation

## Institut de Mécanique Céleste et de Calcul des Épémérides

L'Institut de Mécanique Céleste et de Calcul des Éphémérides (IMCCE) est chargé de la production et la publication des éphémérides officielles,
et mène des activités de recherche théoriques dans les domaines de la mécanique céleste, de la planétologie et
des mathématiques \footnote{\url{https://www.imcce.fr/langues/fr/index.html}}.

L'étude des systèmes dynamiques en astronomie, au cœur des activités de l'institut, fait intervenir des séries de perturbations
qu'il est impossible de traiter sans ordinateur. Le logiciel TRIP développé par Jacques Laskar et Mickaël Gastineau [@gastineau2011trip]
vise précisément la manipulation efficace de ces séries, que nous assimilerons ici à des polynômes.

## TRIP

TRIP est un système de calcul formel développé en FORTRAN et en C dans les années 1990 pour démontrer les théories du comportement chaotique
du système solaire par Jacques Laskar [@laskar1994large] [@laskar2009existence]. En plus d'être un système de calcul interactif, TRIP offre
la possibilité d'écrire des scripts. La syntaxe des scripts est la même que celle de l'interpreteur et est décrite dans le manuel d'utilisation
[***see*** @GL14]. TRIP manipule un grand nombre d'objets mathématiques comme les entiers/flotants multiple précision, les séries,
les vecteurs à n dimensions, les matrices, etc. Le grpahe d'héritage simplifié des objets manipulés dans TRIP est disponible
en annexe \ref{appendix:sun}. Dans ce rapport, nous allons n'étudier principalement que les classes liés aux polynômes à coefficients
entiers et aux polynômes à coefficients entier modulo une puissance d'un premier.

La gestion des nombres dépends de leur type et de leur taille. Pour les petits entiers, les types de base du c++
(int, uint_16, unit_32, unit_64, ...) sont suffisant et disposent d'opérations optimisés fournient par le compilateur.
Pour les plus grands entiers et les flottants, trip utilise des librairies numeriques multiple precision telles que GMP, MFC, MPFR, ...

Mon travail va donc d'être de comprendre le fonctionnement de TRIP pour implémenter un algorithme de factorisation de polynômes.

\ref{appendix:sun}

