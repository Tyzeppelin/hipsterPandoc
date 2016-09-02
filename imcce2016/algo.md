
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


```{.numberLines caption="Source inconnue"}
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

```{caption="Gebbes"}

Input: f a monic polynomial in $\mathbb{F}_q[x]$ with q = $p^m$ and m =1

i = 1
out = 1
b = f'

if b == 0 then
    f = $f^{1/p}$
    out = $SFF(f)^p$
else
    c = gcd(f, b)
    w = f/c
    while w != 1 do
        y = gcd(w, c)
        z = w/y
        out = out$z^i$
        i++
        w = y
        c = c/y
    if c != 1 then
        c = $c^{1/p}$
        out = out$SFF(c)^p$
return out


```

## Distinct-Free Factorization

[see @von2001factoring]

```{caption="DFF"}

Input: f monic squarefree polynomial in $\mathbb{Z}_q$

i:=1; S:={}; h = f;

while deg(h) >= 2i do
    g:= $gcd(h, x^{q^i} - x \mod h)$
    if g != 1 then
        S:= S $\cup$ {(g, i)}
    h:= h/g
    i++
end
if h != 1 then
    s:= s $\cup$ {h, deg(h)}
return S

```


## Equal-Free Factorization

```{caption="EFF [see @von2001factoring]"}
Input :f monic squarefree of degree n=rdwith r>2= irreductible factors
each of degree d
$\epsilon$ a confidence parameter

Factors:={f}; k:=1; t:= $2ceil{log(n^2/\epsilon)}$

while k \leq t do:
  Choose h \in \mathbb{F}_q [x] with deg(h) < n at random
  g:=gcd(h,f)
  if g=1 then
    g:=(h^{(q^d-1)/2}-1 \mod f)
  endif
  for each u \in Factors with deg(u) > h do
    if gcd(g,u) != 1  and gcd(g,u) != u then
      Factors:= Factors\backslash \{u\} \bigcup \{gcd(g,u), u/gcd(g,u)\}
    endif
  if Size(Factors) = r then
    return Factors
endwhile
return Fail

```

``` {caption="EFF @geddes1992algorithms"}

# procedure is named EFF(f, d, p)

Input: f a polynomial in $\mathbb{F}_p$ made up of factors all of degree d

if deg(f) $\leq$ n then return {f}

// degree of each factor
m = deg(f)/n
factors = {f}

while len(factors) < m do :
    v = RandomPoly(degree=2n-1)
    if p = 2 then:
        v = v + $v^2 + ... + v^{2^{nm-1}}$
    else :
        v = $v^{(q^{n}-1)/2}$-1

    g = gcd(f, v)
    if g $\neq$ 1 && g $\neq$ f then
        factors = EFF(g, d, p) $\bigcup$ EFF(f/g, n, p)

return factors

```

### Remontée d'Hensel


``` {caption="remontée d'Hensel"}

# 1. Define new poloynomial and its modulo factor p
alpha = lcoeff(a)

if gamma is undifined then gamma = alpha

a = gamma  a
u^1 = phi_p(gamma  n(u^1))
w^1 = phi_p(gamma  n(w^1))

#2. apply EEA to u^1 w^1

# compute s, t such that su^1+tw^1 (cong) 1 (mod p)
__coef_gcd_ext__(u^1, w^1, d, s, t)

if (d!=1) raise Error: u^1 & w^1 must be coprimes

#3. Initialization for the iteration
u = replace_lc(u^1, gamma) # u = u^1 && lc(u) = gamma
w = replace_lc(w^1, gamma) # w = w^1 && lc(w) = gamma

e = a - u  w
modulus = p

#4. iterate until either a factorization is found or the bound on modulus is reached

while e != 0 && modulus < 2Bgamma
    #4.1 Solve sigmau^1+tauw^1 (cong) c (mod p)

    c = e/modulus$
    sigma^tilde = phi_p(sc)
    tau^tilde = phi_p(tc)

    #q,r such that sigma_tilde = w^1q+r (in Z_p)
    div(sigma_tilde, w^1, q, r)
    sigma = r
    tau = phi(tau_tilde+q  u^1)

    #4.2 update factors and compute error

    u = u + tau  modulus
    w = w + sigma modulus

    e = a - u  w

    modulus += p

end

#5. check
if e = 0
    #Factorization obtained
    delta = cont(u)
    u = u/delta
    w = w/(gamma/delta)

    return u,w
end
else raise Error: no such factorization

```


### Raise to the power of n

``` {caption="raise to power in finite field"}

# procedure is named pow_modp(f, n)

Input: f a polynomial in $\mathbb{F}_p[x]$

if n=1 then return f
if n<p then return pow_generic(f, n)
else
    r = n mod p
    q = n / p
    h = pow_modp(f, q)
    h.raise(p) // $h(x)^p = h(x^p)$
    if r != 0 then h = pow_modp(f, r)
    return h

```

``` {caption="raise"}
Input:  f a polynomial in $\mathbb{F}_p[x]$
        n sur that raise(f,n) return f($x^{p^n}$)

d = degree(f)
for i from 0 to d:
    f[i$p^n$] = f[i]
    f[i]=0

```


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


