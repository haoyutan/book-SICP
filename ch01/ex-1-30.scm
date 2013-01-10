#!/usr/bin/guile -s
!#

(load "ch-1-3-1.scm")

(define (test)
  (define (iter i dummy)
    (if (> i 100)
        dummy
        (iter (+ i 1) (integral cube 0 1 0.0002))))
  (iter 1 0))

(define (print-runtime proc)
  (let ((start-time (runtime))
        (result (proc))
        (end-time (runtime)))
       (display "Running time: ")
       (display (- end-time start-time))
       (newline)))

(print-runtime test)
(print-runtime test)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(print-runtime test)
(print-runtime test)
