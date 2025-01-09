(define (improve guess x)
  (/
    (+
      (/ x (* guess guess))
      (* 2 guess))
    3))

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) (/ (max x 1e-300) 1000)))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (cbrt-iter (improve guess x) x)))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(cbrt 0.000000000000000000000000000000000000000000000000000000000000000000000000000000001) ;3.16e-41
(cbrt 0.00000000000000000000000000000000000000001)
(cbrt 0.000000000000000000001)
(cbrt 0.00000000001)
(cbrt 1)
(cbrt 10000000000)
(cbrt 100000000000000000000)
(cbrt 10000000000000000000000000000000000000000)
(cbrt 100000000000000000000000000000000000000000000000000000000000000000000000000000000) ;1e40
(cbrt 0)