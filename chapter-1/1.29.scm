; #lang scheme

; Exercise 1.29: Simpson’s Rule is a more accurate method
; of numerical integration than the method illustrated above.
; Using Simpson’s Rule, the integral of a function f between
; a and b is approximated as
; (h/3) * (y0 + 4y1 + 2y2 + 4y3 + 2y4 + ... + 2yn−2 + 4yn−1 + yn),
; where h = (b − a)/n, for some even integer n, and y_k = f (a + kh).
; (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments
; f, a, b, and n and returns the value of the integral, computed using Simpson’s Rule.
; Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000),
; and compare the results to those of the integral procedure
; shown above.

(define (even? n)
  (= (remainder n 2) 0))

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))

  (* (sum f (+ a (/ dx 2.0)) add-dx b)
      dx))

(define (integral-simpson f a b n)
  (define h (/ (- b a) n))

  (define (next x)
    (+ x h))

  (define (f-coef x)

    (define k (/ (* (- x a) n)
                 (- b a)))

    (define coef (cond ((= x a) 1)
                       ((= x b) 1)
                       ((even? k) 2)
                       (else 4)))

    (* coef (f x)))

  (* (/ h 3)
     (sum f-coef a next b)))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(integral-simpson cube 0 1 100)
(integral-simpson cube 0 1 1000)
(integral-simpson cube 0 1 10)
(integral-simpson cube 0 1 4)