; Observe that our model of evaluation allows
; for combinations whose operators are compound expressions. Use this observation to describe the behavior of the
; following procedure:
;
; ``` scheme
; (define (a-plus-abs-b a b)
;   ((if (> b 0) + -) a b))
; ```
;
; Answer: `if b > 0`, then use the `+` procedure, else use `-` procedure.
; Pass `a` and `b` as arguments to the resolved procedure then execute it.
; As the name suggests, this will effectivelly add `abs b` to `a`.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))