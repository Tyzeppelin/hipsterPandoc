# Algorithmes de factorisation

La factorisation des polyômes est un problème complexe dont la solution varie surtout selon le nombre d'indéterminées
du polynôme et le domaine des coefficients. Il existe de nombreuses méthodes qui permettent d'approximer la factorisation de polynômes
à coefficients algébriques quelconques [@landau1985factoring] [@cantor1991fast]. Dans le cadre de ce stage, nous ne nous intéresserons qu'à la factorisation des
polynômes univariés à coefficients entiers.

Il n'existe pas de méthode efficace pour factoriser un polynôme directement dans l'anneau $\mathbb{Z}[x]$. Il est beaucoup plus
facile de factoriser un polynome dans un corps fini. Les premières méthodes de factorisations de polynômes à coefficients entiers
se sont d'ailleurs basés sur les propriétés des corps finis. Le début de la formalisation de la factorisation de polynômes à coefficients
entiers a commencé avec Gauss et à connu les plus grandes avancées avec les travaux de E. Berlakamp [@berlekamp1970factoring] et de D. Cantor et H. Zassenhaus [@cantor1981new].
Un résumé de l'histoire de la factorisation de polynôme a été présenté à l'ISSAC 2006 par Joachim von zur Gathen [@von2006polynomial],
auteur du livre _Modern Computer Algebra_ [@von2013modern] et un des contributeurs des méthodes actuelles de factorisation.

## Principe de base

Il existe plusieurs méthodes de factorisation de polynômes dans $\mathbb{Z}[x]$ et le dénominateur commun à ces méthoes est
la descente du polynôme dans un corps fini et sa remontée via le lemme d'Hensel (Lemme \ref{lem:hensel}). La méthode de
factorisation est décrite de manière globale dans la figure \ref{fig:ho} et plus précisement dans l'algorithme \ref{alg:hensel}.

La première partie de la méthode est le calcul de notre polynôme modulo un premier $p$ pour obtenir notre polynôme défini
dans le corps fini de caractéristique p, noté $\mathbb{F}_p[x]$. Notre p ne doit pas diviser le coefficient principal de notre polynôme
et doit être de telle sorte que notre polynôme dans le coprs fini ne possède pas de racines multiples. On note le polynôme à coefficients
dans $\mathbb{F}_p[x]$ $f^{\star}(x)$.

Ensuite nous devons calculer les facteurs irréductibles de $f^{\star}(x)$. La méthode est décrite dans la partie \ref{sec:modular}
et c'est le point que nous allons développer le plus. (mal-dit)

Une fois que l'on possède tous les facteurs de $f^{\star}(x)$ dans $\mathbb{F}_p[x]$, il faut "remonter" les coefficients des facteurs de $f^{\star}(x)$ 
dans un corps de plus grande caractéristique de telle sorte que l'on puisse calculer un arrangement de ces facteurs qui forment les facteurs
de $f(x)$ dans l'anneau des entiers $\mathbb{Z}[x]$. Pour déterminer cet arrangement, il existe deux algorithmes différents. La première consiste à tester toutes
les combinaisons de facteurs possibles jusqu'à trouver la bonne. Cette méthode possède un inconvénient évident: la complexité de cet algorithme est
exponentielle dans le pire des cas. La seconde méthode, beaucoup plus récente,
se base sur les travaux de réductions en lattice de LLL [@hart2011practical]. Cet algorithme a une complexité polynomiale en théorie
même si en pratique il reste moins efficcace que la combinaison de facteurs pour un "petit" nombre de facteurs.

La méthode de factorisation générale est schématisée dans la figure \ref{fig:ho}.

\input{res/ho.tex}
