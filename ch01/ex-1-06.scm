#!/usr/bin/guile -s
!#

(load "lib-1.scm")

#! We can use 'if' clause. !#
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(display (sqrt 3))
(newline)

#! We can also use 'cond' clause. !#
(define (sqrt-iter guess x)
  (cond ((good-enough? guess x) guess)
        (else (sqrt-iter (improve guess x) x))))

(display (sqrt 3))
(newline)

#!
But if we define a 'new-if' function using 'cond',
it does not have the same behavior as 'if' does.
Specifically, all parameters of a function are evaluated
before evaluating the function, but we don't want to
evaluate the else-clause if the predicate is false.
Hence 'if' clause has to be implemented as a special form,
not a function.
!#
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(display (sqrt 3))
(newline)
