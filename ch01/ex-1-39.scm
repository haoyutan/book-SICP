#!/usr/bin/guile -s
!#

(load "ex-1-37.scm")

(define (tangent x rounds)
  (define (term-n i)
    (if (= i 1)
        x
        (- (square x))))
  (define (term-d i)
    (- (* i 2) 1))
  (cont-frac-iterative term-n term-d rounds))

(display "(tangent 1.0 3): ")
(display (tangent 1.0 3))
(newline)

(display "(tangent 1.0 6): ")
(display (tangent 1.0 6))
(newline)

(display "(tangent 1.0 9): ")
(display (tangent 1.0 9))
(newline)

(display "(tan 1.0): ")
(display (tan 1.0))
(newline)
