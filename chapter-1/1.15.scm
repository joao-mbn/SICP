; The sine of an angle (specified in radians)
; can be computed by making use of the approximation sin x ≈ x
; if x is sufficiently small, and the trigonometric identity
;
; sin x = 3 * sin(x / 3) - 4 * (sin(x / 3))^3
;
; to reduce the size of the argument of sin. (For purposes of
; this exercise an angle is considered “sufficiently small” if its
; magnitude is not greater than 0.1 radians.) These ideas are
; incorporated in the following procedures:

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; a. How many times is the procedure p applied when (sine 12.15) is evaluated?
; b. What is the order of growth in space and number of steps (as a function of a) used by the process generated
; by the sine procedure when (sine a) is evaluated?

; Answer:

; a. p is applied ceiling(n) times, for the smallest n that satisfies 12.15/3^n < 0.1
; 121.5 = 3^n -> log 121.5 = log 3^n -> log 121.5 = n log 3 -> n = log 121.5 / log 3 -> n = 4.37
; p is applied 5 times.

; b. space and steps grow with the number of recursive calls to p, where the outer call is dependent on the inner to be resolved.
; As seen above, number of calls to p grows with n, which in turn grows at a logarithmic rate relative to the angle input.
; space growth = O(log x); steps growth = O(log x); x = angle.

(define (even? n)
  (= (remainder n 2) 0))