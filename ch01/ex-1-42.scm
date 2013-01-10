#!/usr/bin/guile -s
!#

(define (square x) (* x x))

(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (main-ex-1-42)
  (display "((compose square inc) 6): ")
  (display ((compose square inc) 6))
  (newline))

#! (main-ex-1-42) !#
