; Define a procedure reverse that takes a list
; as argument and returns a list of the same elements in reverse order:

; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

(define (reverse items)
  (define (iter normal reversed)
    (if (null? normal)
      reversed
      (iter (cdr normal)
            (cons (car normal) reversed))))

  (iter items (list)))

(reverse (list 1 4 9 16 25))