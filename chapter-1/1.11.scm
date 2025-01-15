; A function f is defined by the rule that
; f (n) = n , if n < 3,
;       = f (n - 1) + 2f (n - 2) + 3f (n - 3), if n ≥ 3.
; Write a procedure that computes f by means of a recursive
; process. Write a procedure that computes f by means of an
; iterative process.

; recursive process
(define (f n)
  (if (< n 3)
      n
      (+
        (f (- n 1))
        (* 2 (f (- n 2)))
        (* 3 (f (- n 3))))))

(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)

; iterative process
(define (iter-f n)
  (define (g a b c count)
    (if (= count 0)
      c
      (g (+ a (* 2 b) (* 3 c)) a b (- count 1))))

  (g 2 1 0 n))

(iter-f 0)
(iter-f 1)
(iter-f 2)
(iter-f 3)
(iter-f 4)
(iter-f 5)