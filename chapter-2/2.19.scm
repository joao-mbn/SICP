; Consider the change-counting program of
; Section 1.2.2. It would be nice to be able to easily change the
; currency used by the program, so that we could compute
; the number of ways to change a British pound, for example.
; As the program is written, the knowledge of the currency is
; distributed partly into the procedure first-denomination
; and partly into the procedure count-change (which knows
; that there are five kinds of U.S. coins). It would be nicer
; to be able to supply a list of coins to be used for making
; change.
; We want to rewrite the procedure cc so that its second argument
; is a list of the values of the coins to use rather than
; an integer specifying which coins to use. We could then
; have lists that defined each kind of currency:

; (define us-coins (list 50 25 10 5 1))
; (define uk-coins (list 100 50 20 10 5 2 1 0.5))

; We could then call cc as follows:
; (cc 100 us-coins)
; 292

; To do this will require changing the program cc somewhat.
; It will still have the same form, but it will access its second
; argument differently, as follows:
; (define (cc amount coin-values)
;   (cond ((= amount 0) 1)
;         ((or (< amount 0) (no-more? coin-values)) 0)
;         (else
;           (+ (cc amount
;                  (except-first-denomination
;                   coin-values))
;              (cc (- amount
;                     (first-denomination
;                      coin-values))
;                   coin-values)))))

; Define the procedures first-denomination, except-firstdenomination, and no-more?
; in terms of primitive operations on list structures.
; Does the order of the list coinvalues affect the answer produced by cc? Why or why not?

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))

(define (first-denomination kinds-of-coins) (car kinds-of-coins))
(define (except-first-denomination kinds-of-coins) (cdr kinds-of-coins))
(define (no-more? kinds-of-coins) (null? kinds-of-coins))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 100 uk-coins)

; Order of coins does not matter.
; Regardless of order, all combinations that don't hit the stop condition will be spawned, and their trees.
; Thus 25 25 10 10 10 10 10 will be spawned the same way as 10 10 10 10 10 25 25.
; Changing the order will only change the conditions that hit the stop condition
; e.g. using "10 50 25 5 1" to exchange 100 would have had a stop condition of "10 50 25 25"
; that order "50 25 10 5 1" would have never had.