#!/usr/bin/guile -s
!#

(define (inc x) (+ x 1))

(define (double proc)
  (lambda (x) (proc (proc x))))

(display "(((double (double double)) inc) 5): ")
(display (((double (double double)) inc) 5))
(newline)
