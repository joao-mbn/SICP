; In 1737, the Swiss mathematician Leonhard
; Euler published a memoir De Fractionibus Continuis, which
; included a continued fraction expansion for e − 2, where
; e is the base of the natural logarithms. In this fraction, the
; Ni are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1,
; 6, 1, 1, 8, ... . Write a program that uses your cont-frac
; procedure from Exercise 1.37 to approximate e, based on
; Euler’s expansion

; iterative form
(define (cont-frac-iter n d k)

  (define (frac i acc)
    (if (= i 0)
        acc
        (frac (- i 1) (/ (n i)
                         (+ (d i) acc)))))

  (frac (- k 1) (/ (n k) (d k)))
)

(define e (+ (cont-frac-iter (lambda (i) 1.0)
                             (lambda (i) (cond ((< i 3) i)
                                               ((= (remainder (- i 2) 3) 0)
                                                (+ 2 (* 2 (/ (- i 2) 3))))
                                               (else 1)))
                              10)
              2))

e
