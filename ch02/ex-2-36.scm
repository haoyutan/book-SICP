(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define nil '())

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (main-ex-2-36)
  (define seqs (list (list 1 2 3)
                     (list 4 5 6)
                     (list 7 8 9)
                     (list 10 11 12)))
  (display "seqs=")
  (display seqs)
  (newline)
  (display "(accumulate-n + 0 seqs)=")
  (display (accumulate-n + 0 seqs))
  (newline))
