(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (good-enough-fixed-tolerance? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (good-enough-proportional-tolerance? guess x)
  (< (abs (- (square guess) x)) (/ (max x 1e-300) 1000)))

(define (good-enough-guess-variation? guess x)
  (< (abs (- guess (improve guess x))) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough-proportional-tolerance? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; Using an absolute value as tolerance will be a weak test when x is close in magnitude to the tolerance.
; It looks that a good rule of thumb is to have the tolerance y orders of magnitude smaller than x, where y is also the precision expected.
; e.g. If x = 2 and you want guaranteed precision to the second decimal (3 numbers in total, because there's an integer),
; tolerance should be 2/(10^3) or 0.002.
; This method may also have very long computing times for large numbers, as they will be slow to converge.

; Comparing tolerance over guess variation, as opposed to result of square of the guess is much faster for resolving bigger numbers,
; because guess variation converges linearly, while square of the guess converges exponentially.
; Nonetheless, it has the same problem for small numbers.

; Using a proportional tolerance converges correctly and fast, with precision proportional to the tolerance proportion set.
; But it never converges on x = 0, thus this case must be handled exceptionally.

(sqrt 0.000000000000000000000000000000000000000000000000000000000000000000000000000000001) ;3.16e-41
(sqrt 0.00000000000000000000000000000000000000001)
(sqrt 0.000000000000000000001)
(sqrt 0.00000000001)
(sqrt 1)
(sqrt 10000000000)
(sqrt 100000000000000000000)
(sqrt 10000000000000000000000000000000000000000)
(sqrt 100000000000000000000000000000000000000000000000000000000000000000000000000000000) ;1e40
(sqrt 0)
