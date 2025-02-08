; Show that we can represent pairs of nonnegative integers using only numbers
; and arithmetic operations if we represent the pair a and b as the integer that is
; the product 2^a * 3^b. Give the corresponding definitions of the
; procedures cons, car, and cdr.

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (square b) (/ n 2) a))
          (else (fast-expt-iter b (- n 1) (* a b)))))

  (fast-expt-iter b n 1))

(define (cons a b)
  (* (fast-expt 2 a) (fast-expt 3 b)))

(define (car z)
  (define (factor z)
    (if (= (remainder z 3) 0)
      (factor (/ z 3))
      (/ (log z) (log 2))))

  (factor z))


(define (cdr z)
  (define (factor z)
    (if (= (remainder z 2) 0)
      (factor (/ z 2))
      (/ (log z) (log 3))))

  (factor z))

(car (cons 2 3))
(cdr (cons 2 3))