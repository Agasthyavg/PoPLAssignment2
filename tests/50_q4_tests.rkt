;; Append to a copy of code/50_q4.rkt. Each line should print #t.
(display (equal? (insert-if-short 42 '((1 2) (3 4 5) (6) ()) 3) '((42 1 2) (3 4 5) (42 6) (42)))) (newline)
(display (equal? (insert-if-short 0 '(((1) 2) (3) ((4 5 6) ())) 3) '((0 (0 1) 2) (0 3) (0 (4 5 6) (0))))) (newline)
(display (equal? (insert-if-short 7 '() 3) '(7))) (newline)
(display (equal? (insert-if-short 7 '() 0) '())) (newline)
(display (equal? ((make-inserter 'x (lambda (n) (= n 1))) '((a) ())) '((x a) ()))) (newline)
;; Exercise a 10,000-element flat list and a nesting depth of 100.
(define (make-flat n acc) (if (= n 0) acc (make-flat (- n 1) (cons 'a acc))))
(define (make-deep n value) (if (= n 0) value (make-deep (- n 1) (list value))))
(display (= (my-length (insert-if-short 'x (make-flat 10000 '()) 1)) 10000)) (newline)
(display (pair? (insert-if-short 'x (make-deep 100 '()) 2))) (newline)
