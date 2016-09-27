
// Part 1: Squarefree Factorization

macro sff [f, p, var] {
    private _ALL;
    x:=var $

    j = 1 $
    out = 1 $
    a = f$
    a;
    b = deriv(a, x) $
    b;
    bilan;
    if (b==0) then {
        a = a**(1/p) $
        out = (%sff[a, p])**p $
    }
    else {
        c = __coef_gcd__(a, b) $
        div(a, c, w, res) $

        c;w;


        while (w != 1) do {
            msg("iter -> %d\n", j) $
            y = __coef_gcd__(w, c) $
            div(w, y, z, res) $
            out = out*(z**j) $
            j = j + 1 $
            w = y $
            div(c, y, c, res) $
        } $
        if (c != 1) then {
            c;p;
            c = c**(1/p) $
            out = out*(%sff[c, p]**p) $
        } $
    } $

    return out;
} $
