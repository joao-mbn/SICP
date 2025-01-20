; Most Lisp implementations include a primitive called runtime that returns an integer that specifies
; the amount of time the system has been running (measured, for example, in microseconds).
; The following timedprime-test procedure, when called with an integern, prints
; n and checks to see if n is prime. If n is prime, the procedure
; prints three asterisks followed by the amount of time used
; in performing the test.

(define (even? n)
  (= (remainder n 2) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
  ((divides? test-divisor n) test-divisor)
  (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      0))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (newline)
  (display elapsed-time)
  1)

; Using this procedure, write a procedure search-for-primes
; that checks the primality of consecutive odd integers in a
; specified range. Use your procedure to find the three smallest primes larger than 1000;
; larger than 10,000; larger than 100,000; larger than 1,000,000.
; Note the time needed to test each prime. Since the testing algorithm has order of growth
; of Θ(√n), you should expect that testing for primes around 10,000 should take about √
; 10 times as long as testing for primes around 1000. Do your timing data bear this out?
; How well do the data for 100,000 and 1,000,000 support the Θ(√n) prediction?
; Is your result compatible with the notion
; that programs on your machine run in time proportional to
; the number of steps required for the computation?

; Answer: Yes, the timing bear semblance, but it's hard to measure for numbers than 1e10,
; because the results are too fast and thus the time noisy, meaning that hardware went a
; long way between the release of this book and today.

(define (search-for-primes n)
  (if (even? n)
      (search-for-primes-iter (+ n 1) 0)
      (search-for-primes-iter n 0)))

(define (search-for-primes-iter n primes-found)
  (if (= 3 primes-found)
      true
      (search-for-primes-iter
        (+ 2 n)
        (+ (timed-prime-test n) primes-found))))

(search-for-primes 1e11)