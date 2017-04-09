#lang racket

(define (collatz-chain n)
  (cond
    [(= 1 n) (list 1)]
    [(= 0 (modulo n 2)) (cons n (collatz-chain (/ n 2)))]
    [else (cons n (collatz-chain (+ (* 3 n) 1)))]))

(define (longest-c-chain abv)
  (define (loop i ml mv)
    (let ([l (length (collatz-chain i))])
      (cond
        [(= i 0) mv]
        [(> l ml) (loop (sub1 i) l i)]
        [else (loop (sub1 i) ml mv)])))
  (loop abv 0 0))

;(longest-c-chain 999999)
