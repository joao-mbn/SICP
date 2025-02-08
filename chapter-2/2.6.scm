; In case representing pairs as procedures wasn’t
; mind-boggling enough, consider that, in a language that
; can manipulate procedures, we can get by without numbers
; (at least insofar as nonnegative integers are concerned) by
; implementing 0 and the operation of adding 1 as
;
; (define zero (lambda (f) (lambda (x) x)))
;
; (define (add-1 n)
;   (lambda (f) (lambda (x) (f ((n f) x)))))
;
; This representation is known as Church numerals, afer its
; inventor, Alonzo Church, the logician who invented the λ calculus.
;
; Define one and two directly (not in terms of zero and add1).
; (Hint: Use substitution to evaluate (add-1 zero)).
; Give a direct definition of the addition procedure +
; (not in terms of repeated application of add-1).

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; one -> (add-1 zero) -> (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x)))) -> (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add num1 num2)
  (lambda (f) (lambda (x) ((num1 f) ((num2 f) x)))))

(add one two)
(add (lambda (f) (lambda (x) (f x)))
     (lambda (f) (lambda (x) (f (f x)))))

(lambda (f) (lambda (x)
             (((lambda (f) (lambda (x) (f x))) f)
              (((lambda (f) (lambda (x) (f (f x)))) f) x))))

(lambda (f) (lambda (x)
             (((lambda (f) (lambda (x) (f x))) f)
              ((lambda (x) (f (f x))) x))))

(lambda (f) (lambda (x)
             (((lambda (f) (lambda (x) (f x))) f)
              (f (f x)))))

(lambda (f) (lambda (x)
             ((lambda (x) (f x)) (f (f x)))))

(lambda (f) (lambda (x) (f (f (f x)))))