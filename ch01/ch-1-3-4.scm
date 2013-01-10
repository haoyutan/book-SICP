#!/usr/bin/guile -s
!#

(load "ch-1-3-3.scm")

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt-v1 x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt-v2 x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(define (sqrt-v3 x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))

(define (main-ch-1-3-4)
  (display "(sqrt-v1 3): ")
  (display (sqrt-v1 3))
  (newline)
  (display "(sqrt-v2 3): ")
  (display (sqrt-v2 3))
  (newline)
  (display "(sqrt-v3 3): ")
  (display (sqrt-v3 3))
  (newline))

#! (main-ch-1-3-4) !#
