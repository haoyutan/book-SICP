(define (last-pair z)
  (let ((x (cdr z)))
    (if (null? x)
        z
        (last-pair x))))

(define (main-ex-2-17)
  (define z (list 23 72 149 34))
  (display "z=")
  (display z)
  (newline)
  (display "(last-pair z)=")
  (display (last-pair z))
  (newline))
