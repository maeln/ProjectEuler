#lang racket

(define (smallest-multiple l)
  (add1 (for/last ([i (in-naturals 1)])
    #:break (= 0 (apply + (map (lambda (x) (modulo i x)) l)))
    i)))

(smallest-multiple (range 1 21))