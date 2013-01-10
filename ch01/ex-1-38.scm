#!/usr/bin/guile -s
!#

(load "ex-1-37.scm")

(define (calc-e rounds)
  (define (term-n i) 1.0)
  (define (term-d i)
    (let ((r (remainder i 3)))
         (cond ((= r 0) 1)
               ((= r 1) 1)
               ((= r 2) (* (+ (quotient i 3) 1) 2)))))
  (+ (cont-frac-iterative term-n term-d rounds)
     2))

(display "e=")
(display (calc-e 1000))
(newline)
