#Implémentation et résultats

## TRIP

La première partie de l'implémentation aura été en langage TRIP [@GL14]. Le but de cette implémentation est, d'abord, de
bien appréhender la théorie et de cibler les parties critiques des algorithmes. On peut se rendre compte que la majeure partie
du temps d'éxecution est passée à multiplier des polynômes. Et que aucune fonction d'élévation à une puissance n'était implémentée
pour les polynômes modulo p.

En plus de faire le tour des fonctionnalités de TRIP, cette implémentation aura aussi permis de finir de faire le tri entre les
différentes méthodes possibles. Par exemple, l'algorithme de recomposition basée sur les lattices aurait été trop
compliqué et trop long à implementer totalement et tester.

Le code trip des différentes fonctions de factorisation dans un corps fini est disponible en annexe \ref{appendix:code}.

C'est aussi pendant l'implémentation en langage TRIP que nous avons mis en place les mécanismes de tests des différentes parties de l'algorithmes,
il s'agissait de générer aléatoirement des polynômes dans un corps fini et de les factoriser en utilisant maple. Ensuite, nous nous servons
du résultat fourni par Maple pour vérifier le bon fonctionnement de nos algorithmes.

## C++

La seconde partie du développement aura été l'implémentation en c++. Comme dit précédemment, nous disposions déjà des
cas de tests grace à la première implémentation en TRIP. Il a simplement fallu que je traduise l'algorithme correctement
en prenant en compte des spécificités du c++, comme la gestion manuelle de la mémoire, la gestion des types, ...

La première partie que j'ai implementé a été la factorisation dans un corps fini puisque c'est un des éléments clés de la
factorisation globale. J'ai donc implémenté cette partie et nous avons pu comparer notre début d'implémentation aux
différents autres logiciels/bibliothèques de calcul formel (par exemple Maple et FLINT). On obtient ce graphe du ratio
temps de TRIP sur le temps de maple en fonction du degré du polynôme à factoriser, figure \ref{fig:benchmaple}.

![Comparaison avec maple - avant optimisation \label{fig:benchmaple}](res/benchmaple_old.pdf)

En étudiant le temps que passe trip pour chaque instruction de la factorisation, on peut se
rendre compte que la plus grosse partie du temps de la factorisation est sur 2 instructions d'élévation
d'un polynome a une puissance. Et étant donné que l'élevation à une puissance d'un polynome se base sur la multiplication
de polynômes, c'est sur cette multiplication qu'il y avait le plus de temps à gagner.

De base, les polynomes dans $\mathbb{F}_p[x]$ ne possédaient qu'une multiplication "naive", coefficient par coefficient.
Ensuite, Mickael Gastineau a travaillé à implémenter des nouveaux algorithmes de multiplication. La premiere amelioration
a été d'implémenter la multiplication de Karatsuba[@thome2002karatsuba]. A ce moment la, nous étions plus rapide que Maple
pour factoriser des polynomes univarié dans un corps fini de caracteristique p. Par contre nous étions toujours loin de FLINT qui utlise
une multiplication spéciale qui fait usage de la multiplication de grands entiers en format binaire de GMP [@schonhage1971schnelle].
Avec cette multiplication, nous sommes capables d'égaler FLINT sur le même algorithme, mais sommes toujours moins rapide quand FLINT
utilise la factorisation dynamique, autrement dit quand il choisit l'algorithme et les optimisations en fonction du degré du polynôme
et de la taille des coefficients.


![Comparaison avec maple - après optimisation \label{fig:benchmaple2}](res/benchmaple_new.pdf)

![Comparaison avec flint \label{fig:flint}](res/benchflint.pdf)

## Intégration continue

Le versionnement du code de TRIP est effectué sous SVN et un serveur d'intégration continue, Jenkins en l'occurence, s'occupe de
vérifier en permanence l'intégrité et le bon fonctionnement du logiciel. Jenkins vérifie notament la compilation et le
passage des tests pour une large gamme de compilateurs et d'architecture, on peut citer notamment la majorité des versions récentes
de gcc (>4.92), de clang, de icc (le compilateur C/C++ de Intel), ...

En plus de vérifier si le programme répond bien aux exigences des tests, Jenkins vérifie la couverture de code des tests, c'est-à-dire
que les tests servent à quelque chose et qu'ils n'oublient pas de vérifier le fonctionnement de certains blocs de code.

