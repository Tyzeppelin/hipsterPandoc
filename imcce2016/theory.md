---
header-includes:
    - \usepackage[francais]{babel}
    - \usepackage{amsmath}
    - \usepackage{amsfonts}
    - \usepackage{listings}
    - \lstset{mathescape}
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
décrit dans [@yun1976square] et plus récemment dans [@von2001factoring] (de manière récursive)
ou dans [@kaltofen1982factorization] (de manière itérative).

Il s'agit de calculer recursivement les $\gcd(f, f')$ avec ...


```{.numberLines}
Input: monic polynomial $f \in \mathbb{F}_q [x]$
Output: monic squarefree polynomial
k:= 1
sf:= 1

if f'=0 then
  f:= f$^{1/p}$
  return SFF(f)
else
  c:= gcd(f, f')
  w:= f/c

  while w != 1 do
    y:= gcd(c, w)
    z:= w/y
    R:= R.$z^k$
    w:= y
    c:= c/y
    k++

  if c=1 then
    return R
  else
    return R.SFF$(c^{1/p})^p$

```

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


