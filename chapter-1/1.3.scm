;#lang scheme

; Define a procedure that takes three numbers
; as arguments and returns the sum of the squares of the two
; larger numbers.

(define (square x) (* x x))

(define (sum-sq-largest-two a b c)

  (define first (if (> a b) a b))
  (define second (cond
    ((> c a) c)
    ((> c b) c)
    (else (if (> a b) b a))))

  (+ (square first) (square second)))