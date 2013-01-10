#!/usr/bin/guile -s
!#

(load "lib-1.scm")

(define (cont-frac-iterative term-n term-d k)
  (define (iter cur-value i)
    (if (= i 0)
        cur-value
        (iter (/ (term-n i)
                 (+ (term-d i) cur-value))
              (- i 1))))
  (iter (/ (term-n k) (term-d k))
        (- k 1)))

(define (cont-frac-recursive term-n term-d k)
  (define (recur i)
    (if (= i k)
        (/ (term-n i) (term-d i))
        (/ (term-n i) (+ (term-d i) (recur (+ i 1))))))
  (recur 1))

#!
The recursive process will cause stack overflow
when there are too many rounds.
!#
(define (main-ex-1-37)
  (display "The last output line should show an ERROR,")
  (display " which is intended.")
  (newline)
  (display (cont-frac-iterative (lambda (i) 1.0)
                                (lambda (i) 1.0)
                                1000))
  (newline)
  (display (cont-frac-recursive (lambda (i) 1.0)
                                (lambda (i) 1.0)
                                1000))
  (newline)
  (display (cont-frac-iterative (lambda (i) 1.0)
                                (lambda (i) 1.0)
                                10000))
  (newline)
  (display (cont-frac-recursive (lambda (i) 1.0)
                                (lambda (i) 1.0)
                                10000))
  (newline))

#! (main-ex-1-37) !#
