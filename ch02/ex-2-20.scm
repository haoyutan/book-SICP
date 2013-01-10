#! method 1 !#
(define (same-parity-v1 . z)
  (define (iter prefix z)
    (cond ((null? z) prefix)
          ((null? (cdr z)) (append prefix (list (car z))))
          (else (iter (append prefix (list (car z)))
                      (cdr (cdr z))))))
  (iter '() z))

#! method 2 !#
(define (same-parity-v2 . z)
  (define (same-parity-impl z)
    (if (null? z)
        '()
        (let ((x (car z))
              (y (cdr z)))
             (cond ((null? z) '())
             ((null? y) (list x))
             (else (cons x (same-parity-impl (cdr y))))))))
  (same-parity-impl z))

(define (main-ex-2-20)
  (display (same-parity-v1 1 2 3 4))
  (newline)
  (display (same-parity-v1 1 2 3 4 5))
  (newline)
  (display (same-parity-v2 1 2 3 4))
  (newline)
  (display (same-parity-v2 1 2 3 4 5))
  (newline))