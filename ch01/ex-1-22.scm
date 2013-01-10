#!/usr/bin/guile -s
!#

(load "lib-1.scm")
  
(define (timed-prime-test n)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (display " is not a prime.\n")))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

(timed-prime-test 479001599)
(timed-prime-test 87178291199)
(timed-prime-test 70368760954879)
