#!/usr/bin/guile -s
!#

(load "ch-1-3-1.scm")

(define (integral-simpson-rule f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (term k)
    (cond ((or (= k 0) (= k n)) (y k))
          ((even? k) (* 2 (y k)))
          (else (* 4 (y k)))))
  (* (/ h 3.0) (sum term 0 inc n)))

(define (inverse x) (/ 1.0 x))

(define (main)
  (display "(integral cube 0 1 0.001): ")
  (display (integral cube 0 1 0.001))
  (newline)
  (display "(integral-simpson-rule cube 0 1 4): ")
  (display (integral-simpson-rule cube 0 1 4))
  (newline)
  (display "The exact value is 0.25.\n")
  (newline)
  (display "(integral inverse 1 2 0.001): ")
  (display (integral inverse 1 2 0.001))
  (newline)
  (display "(integral-simpson-rule inverse 1 2 1000): ")
  (display (integral-simpson-rule inverse 1 2 1000))
  (newline)
  (display "The exact value is log(2) (")
  (display (log 2))
  (display ").\n\n"))

(main)
