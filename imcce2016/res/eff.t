
// Part 3: Equal Degree Factorization


//@geddes1992algorithms
macro eff[f, d, p, var] {

    msg "PLEASE DON'T FACTOR IN F2. Not implemented." ;

    private _ALL ;

    x:=var ;

    if (puismax(f, x) <= d) then {
        msg "oh no, not again" ;
        return f ;
    } ;
    f;
    puismax(f, x);
    m = puismax(f, x)/d ;
    factors = [f] ;

    msg("m %d = deg(f) %d / n %d \n", m, puismax(f, x), d);
    while (size(factors) < m) do {
        v = Mod(%rand_poly[2*d-1, [x]], p) ;
        if (p == 2) then {
            //v = v + v^2 + ... + v^(2^(nm-1))
        }
        else {
            (p**d-1)/2;
            v = v**((p**d-1)/2) -1 ;
        };
        g = __coef_gcd__(f, v) ;

        if ((g != 1) && (g != f)) then {
            div(f, g, next_poly, res) ;
            factors = [%eff[g, d, p, [x]]:%eff[next_poly, d, p, [x]]] ;
        } ;
    } ;
    return factors ;
} ;

