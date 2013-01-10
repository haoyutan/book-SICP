(define nil '())

(define (square x) (* x x))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (my:map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              nil sequence))

(define (my:append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (my:length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(define (main-ex-2-33)
  (define s1 (list 1 3 5 8))
  (display "s1=")
  (display s1)
  (newline)
  (display "(map square s1)=")
  (display (map square s1))
  (newline)
  (display "(my:map square s1)=")
  (display (my:map square s1))
  (newline)
  (display "(append s1 (list 11 33))=")
  (display (append s1 (list 11 33)))
  (newline)
  (display "(my:append s1 (list 11 33))=")
  (display (my:append s1 (list 11 33)))
  (newline)
  (display "(length s1)=")
  (display (length s1))
  (newline)
  (display "(my:length s1)=")
  (display (my:length s1))
  (newline))