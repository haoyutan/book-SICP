#!/usr/bin/guile -s
!#

(load "lib-1.scm")

(define (inc x) (+ x 1))

(define (identity x) x)

(define (cube x) (* x x x))

(define (sum-x a b)
  (sum identity a inc b))

(define (sum-cube a b)
  (sum cube a inc b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (main)
  (display "(sum-x 1 100): ")
  (display (sum-x 1 100))
  (newline)
  (display "(sum-cube 2 4): ")
  (display (sum-cube 2 4))
  (newline)
  (display "(integral cube 0 1 0.01): ")
  (display (integral cube 0 1 0.01))
  (newline)
  (display "(integral cube 0 1 0.001): ")
  (display (integral cube 0 1 0.001))
  (newline))

#! (main) !#
