:- use_module(library(lists)).

% A nonempty contiguous split.
split_nonempty(Xs,L,R) :- append(L,R,Xs), L=[_|_], R=[_|_].

% expr(Numbers, Value, Tree) generates expression trees in input order.
expr([N],N,num(N)).
expr(Ns,V,node(Op,L,R)) :-
    split_nonempty(Ns,Left,Right), expr(Left,A,L), expr(Right,B,R),
    operation(Op,A,B,V).
operation('+',A,B,V) :- V is A+B.
operation('-',A,B,V) :- V is A-B.
operation('*',A,B,V) :- V is A*B.
operation('/',A,B,V) :- B =\= 0, 0 is A mod B, V is A div B.

precedence('+',1).
precedence('-',1).
precedence('*',2).
precedence('/',2).
tree_precedence(num(_),3).
tree_precedence(node(Op,_,_),P) :- precedence(Op,P).

% Parenthesize a left child on lower precedence, a right child also on equal.
render(num(N),S) :- number_string(N,S).
render(node(Op,L,R),S) :-
    precedence(Op,P), render_child(L,P,left,LS), render_child(R,P,right,RS),
    atom_string(Op,OS), string_concat(LS,OS,T), string_concat(T,RS,S).
render_child(Tree,P,Side,S) :-
    render(Tree,Inner), tree_precedence(Tree,C),
    ( (C < P ; Side = right, C =:= P) ->
      string_concat("(",Inner,T), string_concat(T,")",S)
    ; S=Inner ).

generate_equation(List,Equation) :-
    split_nonempty(List,L,R), expr(L,V,LT), expr(R,V,RT),
    render(LT,LS), render(RT,RS), string_concat(LS,"=",T), string_concat(T,RS,Equation).
all_equations(List,Equations) :- findall(E,generate_equation(List,E),Es), sort(Es,Equations).
count_equations(List,N) :- all_equations(List,Es), length(Es,N).
