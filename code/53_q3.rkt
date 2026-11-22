#lang racket/base

;; Accumulator traversals place the tree's values before the supplied tail.
(define (inorder tree tail)
  (if (null? tree) tail
      (inorder (cadr tree) (cons (car tree) (inorder (caddr tree) tail)))))
(define (preorder tree tail)
  (if (null? tree) tail
      (cons (car tree) (preorder (cadr tree) (preorder (caddr tree) tail)))))
(define (postorder tree tail)
  (if (null? tree) tail
      (postorder (cadr tree) (postorder (caddr tree) (cons (car tree) tail)))))
(define (tree-height tree)
  (if (null? tree) 0 (+ 1 (max (tree-height (cadr tree)) (tree-height (caddr tree))))))
(define (leaf-count tree)
  (cond ((null? tree) 0)
        ((and (null? (cadr tree)) (null? (caddr tree))) 1)
        (else (+ (leaf-count (cadr tree)) (leaf-count (caddr tree))))))
(define (print-inorder tree)
  (display (inorder tree '())) (newline))
(define (print-all-traversals tree)
  (display (inorder tree '())) (newline)
  (display (preorder tree '())) (newline)
  (display (postorder tree '())) (newline))
(define (print-height-and-leaves tree)
  (display (list (tree-height tree) (leaf-count tree))) (newline))
