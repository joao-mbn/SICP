; The width of an interval is half of the difference between its upper and lower bounds.
; The width is a measure of the uncertainty of the number specified by the
; interval. For some arithmetic operations the width of the
; result of combining two intervals is a function only of the
; widths of the argument intervals, whereas for others the
; width of the combination is not a function of the widths of
; the argument intervals. Show that the width of the sum (or
; difference) of two intervals is a function only of the widths
; of the intervals being added (or subtracted). Give examples
; to show that this is not true for multiplication or division.

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
    x
    (make-interval (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (width interval)
  (/ (- (upper-bound interval)
        (lower-bound interval))
      2))

(define x (make-interval 1 2))
(define y (make-interval 3 8))
(define x2 (make-interval 2 3))
(define y2 (make-interval 4 9))

(newline)
(display (width x)) ; 1/2
(newline)
(display (width y)) ; 5/2
(newline)
(display (width x2)) ; 1/2
(newline)
(display (width y2)) ; 5/2

(newline)
(display (width (sub-interval x y))) ; 3 -> width x + width y
(newline)
(display (width (add-interval x y))) ; 3 -> width x + width y
(newline)
(display (width (sub-interval x2 y2))) ; 3 -> width x + width y
(newline)
(display (width (add-interval x2 y2))) ; 3 -> width x + width y

; despite the width of x = x2 and y = y2; widths for div-interval and mul-interval differ.
(newline)
(display (width (div-interval x y))) ; .27083
(newline)
(display (width (div-interval x2 y2))) ; .26389
(newline)
(display (width (mul-interval x y))) ; 13/2
(newline)
(display (width (mul-interval x2 y2))) ; 19/2
