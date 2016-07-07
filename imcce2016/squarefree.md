
# Squarefree factorization

On a un polynôme f dans $\mathbb{Z}$ 


#### Algorithme

```{.numberLines}
Input: f un polynome dans $\mathbb{Z}$
Output: la decomposition sqaurefree de f ($f_1$, ..., $f_k$)

g:= GCCD(h, h')
$c_1$:= $h/g$
$d_1$:= $h'/g$-$c_1'$

for k>1 until $c_k$=1:
    $f_k$:= GCD($c_k$, $d_k$)
    $c_{k+1}:= c_k$/$f_k$
    $d_{k+1}:= d_k/f_k - c_{k+1}'$

```
