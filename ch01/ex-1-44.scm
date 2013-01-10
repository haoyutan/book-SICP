#!/usr/bin/guile -s
!#

(load "ex-1-43.scm")

(define (smooth f)
  (define dx 0.2)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (square x) (* x x))

(define (main-ex-1-44)
  (display ((smooth square) 1))
  (newline)
  (display ((repeated (smooth square) 3) 1))
  (newline)
  (display ((repeated (smooth square) 5) 1))
  (newline))

#! (main-ex-1-44) !#
