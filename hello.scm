(define (p)
  (display 1)
  (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))