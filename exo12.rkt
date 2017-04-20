#lang racket


(require math)

(define cnt 0)
(define (tnums! n)
  (set! cnt (+ cnt n))
  cnt)

(time (for/last ([i (in-naturals 1)])
  #:final (> (length (divisors (tnums! i))) 500)
  (tnums! 0)))