anthit(ho).
anthit(sutu).
anthit(bao).
anco(linhduong).
anco(huu).
anco(nai).
an(X,Y):-anthit(X), anco(Y).
bian(X,Y):-anco(X), anthit(Y).
