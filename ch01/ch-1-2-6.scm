#!/usr/bin/guile -s
!#

(load "lib-1.scm")

(display "Testing for Primality")
(newline)

(define (print-primality x)
  (format #t
          "(prime? ~a): ~a\n"
          x
          (if (prime? x)
              "Yes"
              "No")))

(define (print-primality-less-than n)
  (do ((i 1 (1+ i)))
      ((>= i n))
    (print-primality i)))

(define (main)
  (print-primality-less-than 10)
  (newline)
  (print-primality-less-than 20))

(main)
