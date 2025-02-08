; Implement a representation for rectangles in
; a plane. (Hint: You may want to make use of Exercise 2.2.)
; In terms of your constructors and selectors, create procedures
; that compute the perimeter and the area of a given rectangle.
; Now implement a different representation for rectangles.
; Can you design your system with suitable abstraction
; barriers, so that the same perimeter and area procedures
; will work using either representation?

(define (square x) (* x x))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (module-segment segment)
  (sqrt (+ (square (- (x-point (start-segment segment)) (x-point (end-segment segment))))
           (square (- (y-point (start-segment segment)) (y-point (end-segment segment)))))))

; implementation assumes perpendicular segments
; implementation 1
(define (make-rectangle-1 length-segment height-segment)

  (let ((length (module-segment length-segment))
        (height (module-segment height-segment)))
    (cons length height)))

; implementation assumes corners with x and y coordinates being both different
; implementation 2
(define (make-rectangle-2 corner-1 corner-2)
  (let ((length (abs (- (x-point corner-1) (x-point corner-2))))
        (height (abs (- (y-point corner-1) (y-point corner-2)))))
    (cons length height)))

(define (length-rectangle rectangle) (car rectangle))
(define (height-rectangle rectangle) (cdr rectangle))

(define (perimeter-rectangle rectangle)
  (* 2 (+ (length-rectangle rectangle) (height-rectangle rectangle))))

(define (area-rectangle rectangle)
  (* (length-rectangle rectangle) (height-rectangle rectangle)))

; 10
(perimeter-rectangle (make-rectangle-1 (make-segment (make-point 0 0) (make-point 2 0)) (make-segment (make-point 0 0) (make-point 0 3))))
(perimeter-rectangle (make-rectangle-2 (make-point 0 0) (make-point 2 3)))

; 6
(area-rectangle (make-rectangle-1 (make-segment (make-point 0 0) (make-point 2 0)) (make-segment (make-point 0 0) (make-point 0 3))))
(area-rectangle (make-rectangle-2 (make-point 0 0) (make-point 2 3)))

