(define (square-tree-1 tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree-1 (car tree))
                    (square-tree-1 (cdr tree))))))

(define (square-tree-2 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-2 sub-tree)
             (* sub-tree sub-tree)))
       tree))

(define (main-ex-2-30)
  (define tree
    (list 1
          (list 2 (list 3 4) 5)
          (list 6 7)))
  (display tree)
  (newline)
  (display (square-tree-1 tree))
  (newline)
  (display (square-tree-2 tree))
  (newline))
