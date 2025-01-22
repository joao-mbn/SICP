; a. An infinite continued fraction is an expression of the form:
;
; f = n1 / (d1 + n2 / (d2 + n3 / (d3 + ...)))
;
; As an example, one can show that the infinite continued fraction expansion with the Ni and the Di all
; equal to 1 produces 1/ϕ, where ϕ is the golden ratio (described in Section 1.2.2).
; One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms.
; Such a truncation—a so-called k-term finite continued fraction—has the form
;
; f = n1 / (d1 + n2 / (... nk/dk))
;
; Suppose that n and d are procedures of one argument
; (the term index i) that return the Ni and Di of the
; terms of the continued fraction. Define a procedure
; cont-frac such that evaluating (cont-frac n d k)
; computes the value of the k-term finite continued fraction.
; Check your procedure by approximating 1/ϕ using

; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            k)

; for successive values of k. How large must you make
; k in order to get an approximation that is accurate to
; 4 decimal places?
;
; b. If your cont-frac procedure generates a recursive process, write one that generates an iterative process.
; If it generates an iterative process, write one that generates a recursive process.

; recursive form
(define (cont-frac n d k)

  (define (frac i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i)
                    (frac (+ 1 i))))))

  (frac 1)
)

; iterative form
(define (cont-frac-iter n d k)

  (define (frac i acc)
    (if (= i 0)
        acc
        (frac (- i 1) (/ (n i)
                         (+ (d i) acc)))))

  (frac (- k 1) (/ (n k) (d k)))
)

; 1/ϕ ~ 0.6180

; k = 10 -> .6179775280898876
(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                10)

