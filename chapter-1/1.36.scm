; Modify fixed-point so that it prints the
; sequence of approximations it generates, using the newline
; and display primitives shown in Exercise 1.22. Then find
; a solution to x^x = 1000 by finding a fixed point of x |-> log(1000)/ log(x).
; (Use Scheme’s primitive log procedure, which computes natural logarithms.)
; Compare the number of steps this takes with and without average damping.
; (Note that you cannot start fixed-point with a guess of 1, as this
; would cause division by log(1) = 0.)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))

  (define (try guess print-count)
    (let ((next (f guess)))
      (cond ((close-enough? guess next)
              (newline)
              (display next)
              (display print-count)
              next)
            (else
              (newline)
              (display next)
              (display "     ")
              (display print-count)
              (try next (+ 1 print-count))))))

  (try first-guess 1))

; Without avg damping -> 32 iterations
(fixed-point (lambda (x) (/ (log 1000) (log x))) 10)

; With avg damping -> 9 iterations
(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 10)