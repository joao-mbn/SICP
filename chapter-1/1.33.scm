; You can obtain an even more general version of accumulate (Exercise 1.32)
; by introducing the notion of a filter on the terms to be combined. That is, combine
; only those terms derived from values in the range that satisfy a specified condition.e resulting filtered-accumulate
; abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that
; specifies the filter. Write filtered-accumulate as a procedure. Show how to express the following using filteredaccumulate:

; a. the sum of the squares of the prime numbers in the
; interval a to b (assuming that you have a prime? predicate already written)

; b. the product of all the positive integers less than n that
; are relatively prime to n (i.e., all positive integers i < n
; such that GCD(i, n) = 1).


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n)
  (* n n))

(define (inc x) (+ x 1))

(define (identity x) x)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (filtered-accumulate combiner null-value predicate term a next b)
  (cond ((> a b) null-value)
        ((predicate a) (combiner (term a)
                                 (filtered-accumulate combiner null-value predicate term (next a) next b)))
        (else (filtered-accumulate combiner null-value predicate term (next a) next b))))


; a
(define (sum-prime-squares a b)
  (filtered-accumulate + 0 prime? square a inc b))

(sum-prime-squares 2 7)

; b
(define (prod-positive-int-less&prime-to-n n)

  (define (relatively-prime? x)
    (= 1 (gcd n x)))

  (filtered-accumulate * 1 relatively-prime? identity 2 inc (- n 1)))

(prod-positive-int-less&prime-to-n 3)
(prod-positive-int-less&prime-to-n 4)
(prod-positive-int-less&prime-to-n 5)