# Algorithmes de factorisation

La factorisation des polyômes est un problème complexe dont la solution varie surtout selon le nombres d'indeterminés
du polynôme et le domaine des coefficients. Il existe de nombreuses méthodes qui permettnt d'approximer la factorisation de polynômes
à coefficients algébrique [***ref. needed***]. Dans le cadre de ce stage nous ne nous intéresserons qu'à la factorisation des
polynômes univariés à coefficients entiers.

Il n'existe pas de méthode efficace pour factoriser un polynôme directement dans l'anneau $\mathbb[x]$. Il est beaucoup plus
facile de factoriser un polynome dans un corps fini. Les premières méthodes de factorisations de polynômes à coefficients entiers
se sont d'ailleurs basé sur les propriétés des corps finis. Un résumé de l'histoire de la factorisation de polynôme a été présenté
à l'ISSAC 2006 par Joachim von zur Gathen [@von2006polynomial], auteur du livre _Modern Computer Algebra_ [@von2013modern] et un
des contributeurs des méthodes actuelles de factorisation.

## Principe de base

Il existe principalement deux méthodes de factorisation de polynômes dans $\mathbb{Z}[x]$ et la seule différence entre les deux se
situe pendant la dernière phase. L'algorithme complet de la méthode de factorisation est décrite dans la section \ref{sec:hensel} et
plus généralement dans l'algorithme \ref{alg:hensel}.

La première partie de la méthode est la préparation du polynôme et le calcul des constantes nécessaire à la suite.
On a notre polynome f dans $\mathbb{Z}[x]$ et on calcul le premier p dans $\mathbb{Z}$ tel que p ne divise pas le
coefficient principal et que f ne possède pas de facteurs multiples dans $\mathbb{F}_p[x]$. Notons le polynômes
à coefficients modulo p $f^{\star}$

Ensuite nous devons calculer les facteurs irréductibles de $f^{\star}$. La méthode est décrite dans la partie \ref{sec:modular}.

Une fois que l'on possède tous les facteurs de f* dans $\mathbb{F}_p[x]$ il faut trouver quelles combinaisons de ces facteurs
forment les facteurs dans $\mathbb{Z}[x]$. Pour cela il y a aussi deux algorithmes différents. Un qui consiste a tester toutes
les combinaisons de facteurs. Cette méthode possède un désaventage évident: la complexité de cet algorithme est
exponentiel dans le pire des cas. La seconde méthode, beaucoup plus récente,
se base sur les travaux de réductions en lattice de LLL [@hart2011practical]. Cet algorithme a une complexité polynomiale en théorie
meme si en pratique il reste moins efficcace que la combinaison de facteurs pour un "petit" nomre de facteurs.

Nous ouvons donc représenter la méthode de factorisation de la manière suivante:

\input{res/ho.tex}


