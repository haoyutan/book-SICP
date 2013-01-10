#! This is what I did before I knew 'pair?'. !#
(define (fringe-old z)
  (define (traverse x result)
    (if (not (list? x))
        (append result (list x))
        (if (= (length x) 0)
            result
            (traverse (cdr x)
                      (traverse (car x) result)))))
  (traverse z '()))

(define nil '())
(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define fringe enumerate-tree)

(define (main-ex-2-28)
  (define x (list (list 1 2) (list nil 4)))
  (display (fringe x))
  (newline)
  (display (fringe (list x x)))
  (newline))
