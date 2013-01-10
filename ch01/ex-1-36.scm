#!/usr/bin/guile -s
!#

(load "ch-1-3-3.scm")

(define (fixed-point-verbose f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (display ",")
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess)
  (newline))

(fixed-point-verbose (lambda (x) (/ (log 1000) (log x))) 1.1)
