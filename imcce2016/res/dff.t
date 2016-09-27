
// Part 2: Distinct Degree factorisation

// [@von2001factoring]
macro dff[f, p] {

j=1 $
h=f $
size_set=int(puismax(f,x)) $

dim S[1:size_set, 1:2] $
S_index = 1 $

while (puismax(h,x) > 2*j) do {

    msg("%d\n", p**j);
    div(Mod(x**(p**j)-x, p), h, quo, res) $
    xmodf = res $
    g=__coef_gcd__(h, xmodf) $

    if (g != 1) then {
        S[S_index, 1] = g $
        S[S_index, 2] = j $
        S_index = S_index + 1 $
    };
    div(h, g, h, res)$
    j = j + 1 $
} $

if (h != 1) then {
    S[S_index, 1] = h $
    S[S_index, 2] = puismax(h, x) $
} $

return S $

} $


