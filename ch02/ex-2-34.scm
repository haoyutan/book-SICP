(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (honor-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* higher-terms x)))
              0
              coefficient-sequence))

(define (main-ex-2-34)
  (define cs (list 1 3 0 5 0 1))
  (display "cs=")
  (display cs)
  (newline)
  (display "(honor-eval 2 cs)=")
  (display (honor-eval 2 cs))
  (newline))
