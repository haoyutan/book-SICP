(define nil '())

(define (unique-pairs from to)
  (define n (+ (- to from) 1))
  (append-map (lambda (i)
                (map (lambda (j) (list i j))
                     (iota (- i 1) from 1)))
              (iota n from 1)))

; load the definition of `prime?'
(load "../ch01/lib-1.scm")

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs 1 n))))

(define (main-ex-2-40)
  (display "(prime-sum-pairs 6)=")
  (display (prime-sum-pairs 6))
  (newline))
