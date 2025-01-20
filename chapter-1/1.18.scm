; Using the results of Exercise 1.16 and Exercise 1.17,
; devise a procedure that generates an iterative process
; for multiplying two integers in terms of adding, doubling,
; and halving and uses a logarithmic number of steps.

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (* a b)
  (cond ((= 1 a) b)
        ((even? a) (* (halve a) (double b)))
        (else (+ a (* (- a 1) b)))))

(* 2 2)
(* 2 4)
(* 4 4)
(* 8 3)