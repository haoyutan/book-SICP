(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (fast-expt-iterative b n)
  (if (= b 0)
      0
      (fast-expt-iterative-iter b n 1 b)))

(define (fast-expt-iterative-iter b n a c)
  (if (= n 0)
      a
      (if (even? n)
          (fast-expt-iterative-iter b
                                    (/ n 2)
                                    a
                                    (square c))
          (fast-expt-iterative-iter b
                                    (/ (- n 1) 2)
                                    (* a c)
                                    (square c)))))
