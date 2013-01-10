#!/usr/bin/guile -s
!#

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (display guess)
    (display ",")
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (lambda (x first-guess)
    (iter first-guess)))

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

(define (sqrt-v1 x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define first-guess 1.0)
  (let ((sqrt-impl (iterative-improve good-enough?
                                      improve)))
    (sqrt-impl x first-guess)))

(define (fixed-point f first-guess)
  (define tolerance 0.0001)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  (define (improve guess)
    (f guess))
  (let ((fixed-point-impl (iterative-improve good-enough?
                                             improve)))
    (fixed-point-impl f first-guess)))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt-v2 x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (main-ex-1-46)
  (display (sqrt-v1 2))
  (newline)
  (display (sqrt-v2 2))
  (newline))

#! (main-ex-1-46) !#
