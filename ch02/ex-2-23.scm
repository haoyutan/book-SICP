(define (my:foreach proc items)
  (if (not (null? items))
      ((proc (car items))
       (my:foreach proc (cdr items)))))

(define (my:display items)
  (for-each (lambda (x) (display x) (newline))
            items))

(define (main-ex-2-23)
  (my:display (list 1 22 333 4444)))
