; Show that sum and product (Exercise 1.31) are both
; special cases of a still more general notion called accumulate
; that combines a collection of terms, using some general accumulation function:

; (accumulate combiner null-value term a next b)

; accumulate takes as arguments the same term and
; range specifications as sum and product, together with
; a combiner procedure (of two arguments) that specifies
; how the current term is to be combined with the
; accumulation of the preceding terms and a null-value
; that specifies what base value to use when the terms
; run out. Write accumulate and show how sum and
; product can both be defined as simple calls to accumulate.

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)

  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))

  (iter a null-value))

(define (sum term a next b)
  (accumulate-iter + 0 term a next b))

(define (product term a next b)
  (accumulate-iter * 1 term a next b))

(define (cube x)
  (* x x x))

(define (sum-cubes a b)
  (define (next x) (+ x 1))

  (sum cube a next b))

(define (product-cubes a b)
  (define (next x) (+ x 1))

  (product cube a next b))

(sum-cubes 0 3)
(product-cubes 1 3)