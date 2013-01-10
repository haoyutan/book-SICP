(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (branch-weight branch)
  (let ((s (branch-structure branch)))
    (if (list? s)
        (mobile-weight s)
        s)))

(define (mobile-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define total-weight mobile-weight)

(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (= (* (branch-weight left) (branch-length left))
       (* (branch-weight right) (branch-length right)))))

#!
Binary mobile A:
                M
            10/   \12
            0.6   0.5

Binary mobile B:
                 M
          L1/         \L2
           X           Z
      L3/     \L4 L5/     \L6
       a       Y   d       e
            L7/ \L8
             b   c
!#

(define (create-mobile-A)
  (let ((L1 (make-branch 10 0.6))
        (L2 (make-branch 12 0.5)))
    (make-mobile L1 L2)))

(define (create-mobile-B a b c d e)
  (let ((L7 (make-branch 1 b))
        (L8 (make-branch 1 c)))
    (let ((Y (make-mobile L7 L8))
          (L3 (make-branch 1 a)))
      (let ((L4 (make-branch 1 Y))
            (L5 (make-branch 1 d))
            (L6 (make-branch 1 e)))
        (let ((X (make-mobile L3 L4))
              (Z (make-mobile L5 L6)))
          (let ((L1 (make-branch 1 X))
                (L2 (make-branch 1 Z)))
            (let ((M (make-mobile L1 L2)))
               M)))))))

(define (main-ex-2-29)
  (define M1 (create-mobile-A))
  (define M2 (create-mobile-B 0.2 0.1 0.1 0.2 0.2))
  (define M3 (create-mobile-B 0.2 0.2 0.2 0.2 0.2))
  (display (total-weight M1))
  (newline)
  (display (total-weight M2))
  (newline)
  (display (total-weight M3))
  (newline)
  (display (balanced? M1))
  (newline)
  (display (balanced? M2))
  (newline)
  (display (balanced? M3))
  (newline))
