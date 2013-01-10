#!/usr/bin/guile -s
!#

(load "ex-1-22.scm")

(define (start-prime-test n start-time)
  (if (fast-prime? n (floor (log n)))
      (report-prime (- (runtime) start-time))
      (display " is not a prime.\n")))

(timed-prime-test 479001599)
(timed-prime-test 87178291199)
(timed-prime-test 70368760954879)
