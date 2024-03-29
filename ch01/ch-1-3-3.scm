#!/usr/bin/guile -s
!#

(load "lib-1.scm")

#! half-interval method !#
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))

#! fixed-point method !#
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(define (main-ch-1-3-3)
  (display "(half-interval-method sin 2.0 4.0): ")
  (display (half-interval-method sin 2.0 4.0))
  (newline)
  (display "(fixed-point cos 1.0): ")
  (display (fixed-point cos 1.0))
  (newline)
  (display "(sqrt 2): ")
  (display (sqrt 2))
  (newline))

#! (main-ch-1-3-3) !#
