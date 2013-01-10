#!/usr/bin/guile -s
!#

(load "ex-1-22.scm")

(define (next-divisor x)
  (cond ((< x 2) 2)
        ((even? x) (+ x 1))
        (else (+ x 2))))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next-divisor test-divisor)))))

(load "ex-1-22.scm")
