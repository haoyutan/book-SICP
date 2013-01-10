#!/usr/bin/guile -s
!#

(load "ex-1-42.scm")

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (lambda (x)
        ((compose f (repeated f (- n 1)))
         x))))

(define (square x) (* x x))

(define (main-ex-1-43)
  (display ((repeated square 2) 5))
  (newline))

#! (main-ex-1-43) !#
