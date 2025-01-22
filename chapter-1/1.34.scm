; Suppose we define the procedure
; (define (f g) (g 2))
; Then we have
; (f square) -> 4
; (f (lambda (z) (* z (+ z 1)))) -> 6
; What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.

; Answer: It will throw an error. (f f) -> (f 2) -> (2 2). (2 2) is not a valid operation.

(define (f g) (g 2))

(f f)