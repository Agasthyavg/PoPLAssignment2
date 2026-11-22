:- begin_tests(puzzle).
:- ensure_loaded('../code/50_q1.pl').
test(original_count) :- count_solutions([1,2,3,4,5,6,7,8],3).
test(repaired_count) :- count_solutions([1,2,3,4,5,6,7,8,9],1).
test(no_clues) :- count_solutions([],13824).
test(solution_clue9) :- once(solution([1,2,3,4,5,6,7,8,9],S)), member(p(A,_,_,'AI'),S), member(p(B,_,_,embedded),S), A @< B, !.
:- end_tests(puzzle).
