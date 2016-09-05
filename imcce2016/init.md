### Initialisation

Dans la première partie, notre but est de calculer les principales constantes qui nous serons necessaire dans la suite du calcul.

Nous devons calculer la borne de Mignotte qui nous permettra dans la combinaison[ref], de savoir si notre groupe de facteurs est belle est
bien un facteur de f dans Z ou pas.
Il nous faut bien évidement calculer (trouver un) p tel que notre polynome reste Squarefree dans F_p et qu'il ne divise pas le leading coeficient de f.

Ensuite on utilise ... pour calculer l qui est la puissance de p dans laquelle on eleve les facteurs de f.


%YUN%

``` {.numberlines .caption="INIT"}
A <- ||f||_infinite
b <- lc(f)
B <- (n+1)^{1/2}2^nAb
C <- (n+1)^{2n}A^{2n-1}
gamma <- [2log_2(c)]

reapeat chose a prime p <= 2gamma*ln(gamma)
	f* <- f mod p
until p doesn't divide b and gcd(f*, f*') congrue a 1 mod p / = 1 in F_p[x]

l <- [log_p(2B+1]
```