#lang racket

(define (fibonacci n)
  (cond
    [(= n 1) 1]
    [(= n 2) 2]
    [else (+ (fibonacci (- n 1)) (fibonacci (- n 2)))]))

(define (fibo-until-4m)
  (for/list ([i (in-naturals 1)])
    #:break (> (fibonacci i) 4000000)
    (fibonacci i)))

(apply + (filter even? (fibo-until-4m)))