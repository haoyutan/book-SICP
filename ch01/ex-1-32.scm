#!/usr/bin/guile -s
!#

(define (accumulate combiner null-value term a next b)
  (define (iter result cur-value)
    (if (> cur-value b)
        result
        (iter (combiner result cur-value)
              (term (next cur-value)))))
  (iter null-value a))

(define (sum a b)
  (accumulate + 0 (lambda (x) x) a (lambda (x) (+ x 1)) b))

(define (product a b)
  (accumulate * 1 (lambda (x) x) a (lambda (x) (+ x 1)) b))

(display "(sum 1 100): ")
(display (sum 1 100))
(newline)
(display "(product 1 6): ")
(display (product 1 6))
(newline)
