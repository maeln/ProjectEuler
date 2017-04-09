#lang racket

(define (divisors n)
  (filter (lambda (x) (= 0 (modulo n x))) (range 1 (+ n 1))))

;(define (tri-nums n)
;  (for/last ([i (range 1 (+ n 1))])
;    (apply + (range 1 (+ i 1)))))

(define cnt 0)
(define (tnums! n)
  (set! cnt (+ cnt n))
  cnt)

;(time (for/last ([i (in-naturals 1)])
;  #:final (> (length (divisors (tri-nums i))) 100)
;  (tri-nums i)))

(time (for/last ([i (in-naturals 1)])
  #:final (> (length (divisors (tnums! i))) 500)
  (tnums! 0)))