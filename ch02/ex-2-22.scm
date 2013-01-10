(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(define (square-list-modified items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    (list (square (car things)))))))
  (iter items '()))

(define (main-ex-2-22)
  (display "(square-list (list 1 3 4)): ")
  (display (square-list (list 1 3 4)))
  (newline)
  (display "(square-list-modified (list 1 3 4)): ")
  (display (square-list-modified (list 1 3 4)))
  (newline))
