#lang racket

(define (eratosthene n)
  (define (loop l res)
    (if (empty? l)
        res
        (loop (filter (lambda (x) (not (= 0 (modulo x (first l))))) (rest l)) (cons (first l) res))))
  (loop (range 2 (add1 n)) '()))

(apply + (eratosthene 2000000))