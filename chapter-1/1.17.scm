; The exponentiation algorithms in this section are based on performing exponentiation by means of
; repeated multiplication. In a similar way, one can perform
; integer multiplication by means of repeated addition. The
; following multiplication procedure (in which it is assumed
; that our language can only add, not multiply) is analogous
; to the expt procedure:
;
; (define (* a b)
;   (if (= b 0)
;   0
;   (+ a (* a (- b 1)))))
;
; This algorithm takes a number of steps that is linear in b.
; Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which
; divides an (even) integer by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a
; logarithmic number of steps.

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

; Recursive implementation
(define (* a b)
  (cond ((= 1 a) b)
        ((even? a) (double (* (halve a) b)))
        (else (+ a (* (- a 1) b)))))

; n steps:
;   2 * 2 -> double ( halve (2) * 2 ) -> double ( 1 * 2 ) -> double ( 2 ) = 4 | steps = 1
;   4 * 2 -> double ( halve (4) * 2 ) -> double ( 2 * 2 ) -> double ( double ( halve (2) * 2 ) )
;         -> double ( double ( 1 * 2 ) ) -> double ( double ( 2 ) ) -> double ( 4 ) -> 8 | steps = 2
;   ...

(* 2 2)
(* 2 4)
(* 4 4)
(* 8 3)

