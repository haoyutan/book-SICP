#! ex-2-18 !#
(define (my:reverse z)
  (if (null? z)
      '()
      (append (my:reverse (cdr z)) (list (car z)))))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))

(define nil '())

(define (my:reverse-by-fold-right z)
  (fold-right (lambda (x y) (cons x y)) nil z))

(define (my:reverse-by-fold-left z)
  (fold-left (lambda (x y) (append x (list y))) nil z))

(define (main-ex-2-39)
  (define z (list 1 4 9 16 25))
  (display "z=")
  (display z)
  (newline)
  (display "(my:reverse z)=")
  (display (my:reverse z))
  (newline)
  (display "(my:reverse-by-fold-right z)=")
  (display (my:reverse-by-fold-right z))
  (newline)
  (display "(my:reverse-by-fold-left z)=")
  (display (my:reverse-by-fold-left z))
  (newline)
)
