:- begin_tests(equations).
:- ensure_loaded('../code/53_q2.pl').
test(example) :- all_equations([4,2,5,3],["4*2-5=3","4*2=5+3","4-2=5-3","4/2=5-3","4=2*(5-3)","4=2+(5-3)","4=2+5-3"]).
test(no_solution) :- all_equations([2,3,4],[]).
test(simple) :- all_equations([2,4,8],["2*4=8"]).
test(empty) :- all_equations([],[]).
test(single) :- all_equations([1],[]).
test(zero_divisor) :- all_equations([1,0],[]).
test(equal_zero) :- all_equations([0,0],["0=0"]).
test(right_associative_print) :- render(node('+',num(1),node('+',num(2),num(3))),"1+(2+3)").
test(left_associative_print) :- render(node('/',node('/',num(8),num(4)),num(2)),"8/4/2").
:- end_tests(equations).
