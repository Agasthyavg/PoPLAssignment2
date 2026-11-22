% Generate all assignments, then check the selected clues on ground terms.
:- use_module(library(lists)).

assignment(S) :-
    permutation([research,development,design,testing], [DA,DB,DC,DD]),
    permutation([python,java,'c++',javascript], [LA,LB,LC,LD]),
    permutation(['AI',web,embedded,data], [PA,PB,PC,PD]),
    S = [p('Alex',DA,LA,PA),p('Ben',DB,LB,PB),
         p('Carla',DC,LC,PC),p('Dana',DD,LD,PD)].

clue(1,S) :- member(p(N,D,_,'AI'),S), D \= research, N \= 'Dana'.
clue(2,S) :- member(p('Alex',D,L,_),S), D \= development, L \= 'c++'.
clue(3,S) :- member(p(_,testing,python,_),S).
clue(4,S) :- member(p('Ben',D,_,web),S), D \= testing.
clue(5,S) :- member(p(_,design,java,_),S).
clue(6,S) :- member(p('Carla',D,_,P),S), P \= embedded, D \= development.
clue(7,S) :- member(p('Dana',D,L,_),S), L \= java, member(D,[research,testing]).
clue(8,S) :- member(p(_,research,L,data),S), L \= javascript.
% CLUE 9: The AI-preferring friend comes alphabetically before the embedded-project friend.
clue(9,S) :- member(p(A,_,_,'AI'),S), member(p(B,_,_,embedded),S), A @< B.

satisfies([], _).
satisfies([N|Ns], S) :- clue(N,S), satisfies(Ns,S).
solution(Active,S) :- assignment(S), satisfies(Active,S).
count_solutions(Active,N) :- findall(S,solution(Active,S),Ss), length(Ss,N).
print_person(p(N,D,L,P)) :- format('~w = [~w, ~w, ~w]~n',[N,D,L,P]).
print_people([]).
print_people([P|Ps]) :- print_person(P), print_people(Ps).
main :- once(solution([1,2,3,4,5,6,7,8,9],S)), print_people(S).
