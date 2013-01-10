#!/usr/bin/guile -s
!#

(load "ch-1-3-3.scm")

#! It is easy to get 1.618 but difficult to get -0.618. !#
(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
(newline)
(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) -0.61803))
(newline)
(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) -0.618034))
(newline)
