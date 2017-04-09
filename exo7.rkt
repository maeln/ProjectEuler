#lang racket

(define (prime? n)
  (define (prec? i)
    (cond
      [(= i 1) #t]
      [(= 0 (modulo n i)) #f]
      [else (prec? (sub1 i))]))
  (prec? (sub1 n)))

(define (10001thprime)
  (define (pmrec i l)
    (if (= 10001 (length l))
        (sub1 i)
        (pmrec (add1 i) (if (prime? i) (cons i l) l))))
  (pmrec 2 '()))

(10001thprime)