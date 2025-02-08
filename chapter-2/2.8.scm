; Using reasoning analogous to Alyssa’s, describe how the difference of two intervals may be computed.
; Define a corresponding subtraction procedure, called sub-interval.

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (make-interval a b) (cons a b))

(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(sub-interval (make-interval 2 6) (make-interval 1 3))