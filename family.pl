male(tom).
male(teter).
male(doug).
male(david).
female(susan).
parent(doug, susan).
parent(tom, david).
parent(doug, david).
parent(doug, tom).

grandfather(X, Y):-male(X), parent(X, Z), parent(Z, Y).
grandmother(X, Y):-female(X), parent(X, Z), parent(Z, Y).

