; Define a procedure double that takes a procedure of one argument as argument
; and returns a procedure that applies the original procedure twice.
; For example, if inc is a procedure that adds 1 to its argument, then
; (double inc) should be a procedure that adds 2. What value is returned by
; (((double (double double)) inc) 5)

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ 1 x))

; 21
(((double double) inc) 5)

; every nested double: 2^1 -> 2^2 -> 2^2 * 2^2 = 2^4 -> 2^4 * 2^4 = 2^8 ...
; powers: 1 -> 2 -> 4 -> 8...
; general rule: 2^(2^(n - 1))