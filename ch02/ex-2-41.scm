(define nil '())

(define (distinct-ordered-sequence len from to)
  (define n (+ (- to from) 1))
  (if (= len 0)
      (list nil)
      (append-map (lambda (head)
                    (if (> (- (+ head len) 1) to)
                        nil
                        (map (lambda (subseq) (cons head subseq))
                             (distinct-ordered-sequence (- len 1)
                                                        (+ head 1)
                                                        to))))
                  (iota n from 1))))

(define (triples-sum-to-s s n)
  (filter (lambda (triple) (= (fold + 0 triple) s))
          (distinct-ordered-sequence 3 1 n)))

(define (main-ex-2-41)
  (display "(distinct-ordered-sequence 3 1 5)=")
  (display (distinct-ordered-sequence 3 1 5))
  (newline)
  (display "(triples-sum-to-s 8 6)=")
  (display (triples-sum-to-s 8 6))
  (newline))
