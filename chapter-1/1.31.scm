; a. The sum procedure is only the simplest of a vast number of
; similar abstractions that can be captured as higher
; order procedures. Write an analogous procedure called
; product that returns the product of the values of a
; function at points over a given range.
; Show how to define factorial in terms of product.
; Also use product to compute approximations to π using the formula

; π/4 = (2 · 4 · 4 · 6 · 6 · 8 ...) / (3 · 3 · 5 · 5 · 7 · 7 ...)

; b. If your product procedure generates a recursive process,
; write one that generates an iterative process.
; If it generates an iterative process,
; write one that generates a recursive process.

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))

  (iter a 1))

(define (factorial b)

  (define (term x)
    (if (< x 2)
        1
        x))

  (define (next x) (+ x 1))

  (product-iter term 0 next b))

(define (pi-approximation)
  (define (term x)
    (/ (* x (+ x 2))
       (* (+ x 1) (+ x 1))))

  (define (next x) (+ x 2))

  (* 4 (product-iter term 2.0 next 2000)))

(factorial 0)
(factorial 1)
(factorial 2)
(factorial 3)
(factorial 10)
(pi-approximation)