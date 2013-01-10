#! use a larger stack size (the original value is 20000) !#
(debug-set! stack 200000)

#! guile does not have 'runtime' !#
(define (runtime)
  (tms:clock (times)))

#! basic math functions !#
(define (square x)
  (* x x))
(define (even? x)
  (= (remainder x 2) 0))
(define (average x y)
  (/ (+ x y) 2))

#! searching for divisors !#
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

#! a common algorithm for testing primality !#
(define (prime? n)
  (= (smallest-divisor n) n))

#! the Fermat test !#
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

#! sum !#
(define (sum f a next b)
  (if (> a b)
      0
      (+ (f a) (sum f (next a) next b))))
