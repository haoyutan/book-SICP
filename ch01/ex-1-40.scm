#!/usr/bin/guile -s
!#

(load "ch-1-3-4.scm")

(define (cube x) (* x x x))

(define (cubic a b c)
  (lambda (x)
          (+ (cube x) (* a (square x)) (* b x) c)))

(display "The root of x^3+2x^2+3x+4 is: ")
(display (newtons-method (cubic 2 3 4) 1.0))
(newline)
