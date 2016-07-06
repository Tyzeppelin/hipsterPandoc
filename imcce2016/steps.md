---
header-includes:
    - \usepackage{amsmath}
    - \usepackage{amsfonts}
bibliography: biblio.bib
---

# Factorisation des polynômes univariés dans \boldmath$\mathbb{F}_q [x]$


La factorisation de polynômes univariés dans $\mathbb{F}_q [x]$ se décrit généralement en 3 étapes :

1. Square-Free Factorization  
    Input: $f \in \mathbb{F}_q [x], deg(f) = n$  
    Output: $f_1,..., f_n \in \mathbb{F}_q [x]$ so that $f = f_1...f_n^n$ square-free

1. Distinct-Free Factorization  
    Input: $f \in \mathbb{F}_q [x], deg(f) = n$, f is squarefree  
    Output: the set of all pairs (g, d) f is the product of all monic irreductible factors og f of degree d

1. Equal-Free Factorization  
    Input: (?) ((basiquement le resultat de l'etape d'avant))  
    Output: ${f_1, ..., f_k}$ set of irreducible factors of f in $\mathbb{F}_q [x]$




## Square-Free Factorization

Le principe est d'obtenir un polynôme square-free, cad qu'il ne possède pas de racines multiples.

La façon la plus répandue d'obtenir un polynôme squarefree est d'utiliser l'algorithme de Yun
décrit dans [@yun1976square] et plus récemment dans [@von2001factoring].

Il s'agit de calculer recursivement les $\gcd(f, f')$ avec ...


## Distinct-Free Factorization

Lorem Ipsum

## Equal-Free Factorization

Lorem Ipsum


### Gibberish


descente de Z dans Fq -> f mod p^n
remonté de Fq dans Z -> Hensel Lemma


$f \in \mathbb{F}_q [x], deg(f) = n$

\\/ factor f squarefree in $\mathbb{F}_q$ (Yun)

$f_1,..., f_n \in \mathbb{F}_q [x]$ so that $f = f_1...f_n^n$

\\/ "distinct degree" or produce a set as following

$f^{[1]}, ..., f^{[n]} \in \mathbb{F}_q [x]$ so that for $1 \leq d \leq n$ , $f^{[d]}$ is a product of monic irreducible factor of f of degree d

\\/ "equal degree" or produce a factorization of f in $\mathbb{F}_q [x]$ (Shoup)

${f_1, ..., f_k}$ set of irreducible factors of f in $\mathbb{F}_q [x]$

\\/ Hensel lift (?) / find true fators of f in $\mathbb{Z} [x]$

a factorization of f in $\mathbb{Z} [x]$


