; The following paern of numbers is called
; Pascal's triangle.
;
;           1
;         1   1
;       1   2   1
;     1   3   3   1
;   1   4   6   4   1
;         . . .
;
; The numbers at the edge of the triangle are all 1, and each
; number inside the triangle is the sum of the two numbers
; above it. Write a procedure that computes elements of
; Pascal's triangle by means of a recursive process.

(define (pascal-triangle-element row col)
  (if (or
        (= col 1)
        (= row col))
        1
        (+
          (pascal-triangle-element
            (- row 1)
            (- col 1))
          (pascal-triangle-element
            (- row 1)
            col))))