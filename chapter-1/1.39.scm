; A continued fraction representation of the
; tangent function was published in 1770 by the German mathematician J.H. Lambert:
; tan x = x / (1 - x^2 / (3 - x^2 / 5 - ...))
; where x is in radians. Define a procedure (tan-cf x k) that
; computes an approximation to the tangent function based
; on Lambert’s formula. k specifies the number of terms to
; compute, as in Exercise 1.37.

; iterative form
(define (cont-frac-iter n d k)

  (define (frac i acc)
    (if (= i 0)
        acc
        (frac (- i 1) (/ (n i)
                         (+ (d i) acc)))))

  (frac (- k 1) (/ (n k) (d k)))
)

(define (tan-x x)
  (cont-frac-iter (lambda (i) (if (= i 1) x (* -1 x x)))
                  (lambda (i) (- (* 2 i) 1))
                  10))

; tan pi -> -9.265548215448259e-5 ~ 0
(tan-x 3.1415)

; tan pi/4 -> .9999536742781562 ~ 1
(tan-x (/ 3.1415 4))