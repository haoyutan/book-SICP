(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (append-map
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (enumerate-interval from to)
  (iota (+ (- to from) 1) from 1))

(define (adjoin-position new-row k rest-of-queens)
  (xcons rest-of-queens (list new-row k)))
; or (append rest-of-queens (list (list new-row k)))

(define empty-board '())

(define (safe? k positions) #t)
