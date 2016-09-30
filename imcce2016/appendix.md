\appendix{Annexes}

# Hiérarchie simplifié des classes manipulées par TRIP

\begin{figure}[!hb]
    \label{appendix:sun}
    \centering
    \begin{tabular}{@{}c@{\hspace{.5cm}}c@{}}
        \includegraphics[width=.65\textwidth]{res/inherit.png}
    \end{tabular}
    \caption{Hiérarchie simplifiée des classes}
\end{figure}


# Code TRIP de la factorisation dans un corps fini
\label{appendix:code}


```{.TRIP .caption:sfff }
// Part 1: Squarefree Factorization

macro sff [f, p, var] {
    private _ALL;
    x:=var ;

    j = 1 ;
    out = 1 ;
    a = f;
    a;
    b = deriv(a, x) ;
    b;
    bilan;
    if (b==0) then {
        a = a**(1/p) ;
        out = (%sff[a, p])**p ;
    }
    else {
        c = __coef_gcd__(a, b) ;
        div(a, c, w, res) ;

        while (w != 1) do {
            y = __coef_gcd__(w, c) ;
            div(w, y, z, res) ;
            out = out*(z**j) ;
            j = j + 1 ;
            w = y ;
            div(c, y, c, res) ;
        } ;
        if (c != 1) then {
            c;p;
            c = c**(1/p) ;
            out = out*(%sff[c, p]**p) ;
        } ;
    } ;

    return out;
} ;
```

```
// Part 2: Distinct Degree factorisation

// [@von2001factoring]
macro dff[f, p] {

j=1 ;
h=f ;
size_set=int(puismax(f,x)) ;

dim S[1:size_set, 1:2] ;
S_index = 1 ;

while (puismax(h,x) > 2*j) do {

    msg("%d\n", p**j);
    div(Mod(x**(p**j)-x, p), h, quo, res) ;
    xmodf = res ;
    g=__coef_gcd__(h, xmodf) ;

    if (g != 1) then {
        S[S_index, 1] = g ;
        S[S_index, 2] = j ;
        S_index = S_index + 1 ;
    };
    div(h, g, h, res);
    j = j + 1 ;
} ;
return S ;
} ;

```

```
// Part 3: Equal Degree Factorization

//@geddes1992algorithms
macro eff[f, d, p, var] {
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

    while (size(factors) < m) do {
        v = Mod(%rand_poly[2*d-1, [x]], p) ;
        (p**d-1)/2;
        v = v**((p**d-1)/2) -1 ;
        g = __coef_gcd__(f, v) ;

        if ((g != 1) && (g != f)) then {
            div(f, g, next_poly, res) ;
            factors = [%eff[g, d, p, [x]]:%eff[next_poly, d, p, [x]]] ;
        } ;
    } ;
    return factors ;
} ;
```

# Exemples d'arbres de facteurs

\begin{figure}[hb]\centering
	\label{fig:51}
	\input{res/tree51.tex}
	\caption{Arbre des facteurs de $x^4-1 \mod 5$}
\end{figure}

\begin{figure}[hb]\centering
	\label{fig:52}
	\input{res/tree52.tex}
	\caption{Arbre des facteurs de $x^4-1 \mod 5^2$}
\end{figure}

\begin{figure}[hb]\centering
	\label{fig:53}
	\input{res/tree53.tex}
	\caption{Arbre des facteurs de $x^4-1$ mod $5^3$}
\end{figure}

\begin{figure}[hb]\centering
	\label{fig:56}
	\input{res/tree56.tex}
	\caption{Arbre des facteurs de $x^4-1 \mod 5^6$}
\end{figure}
