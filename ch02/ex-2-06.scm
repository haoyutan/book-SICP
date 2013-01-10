(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define three
  (lambda (f) (lambda (x) (f (f (f x))))))

(define (inc2 x) (+ x 2))

(define (print-num x)
  (display x)
  (newline))

(print-num ((zero inc2) 1000))
(print-num (((add-1 zero) inc2) 1000))
(print-num ((one inc2) 1000))
(print-num (((add-1 one) inc2) 1000))
(print-num ((two inc2) 1000))
(print-num (((add-1 two) inc2) 1000))
(print-num ((three inc2) 1000))

(print-num ((three inc2) ((two inc2) 1000)))

(define (add-any n m)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))

(define five (add-any two three))

(print-num ((five inc2) 1000))
