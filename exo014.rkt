#lang racket

; Naïve implementation.

;(define (collatz-chain n)
;  (cond
;    [(= 1 n) (list 1)]
;    [(= 0 (modulo n 2)) (cons n (collatz-chain (/ n 2)))]
;    [else (cons n (collatz-chain (+ (* 3 n) 1)))]))

;(define (longest-c-chain abv)
;  (define (loop i ml mv)
;    (let ([l (length (collatz-chain i))])
;      (cond
;        [(= i 1) mv]
;        [(> l ml) (loop (sub1 i) l i)]
;        [else (loop (sub1 i) ml mv)])))
;  (loop abv 0 0))


; Slightly optimized version using memoïzation.
(define mem (make-hash))

(define (memoizationcc n)
  (define (f m l)
    (cond
      [(hash-has-key? mem m) (append l (hash-ref mem m))]
      [(= 1 m) (begin (hash-set! mem n (cons 1 l)) (cons 1 l))]
      [(= 0 (modulo m 2)) (f (/ m 2) (cons m l))]
      [else (f (+ (* 3 m) 1) (cons m l))]))
  (hash-ref! mem n (f n '())))

(define (longest-c-chain-mem abv)
  (define (loop i ml mv)
    (let ([l (length (memoizationcc i))])
      (cond
        [(= i abv) mv]
        [(> l ml) (loop (add1 i) l i)]
        [else (loop (add1 i) ml mv)])))
  (loop 1 0 0))

;(time (longest-c-chain 999999))
;(time (longest-c-chain-mem 999999))
(longest-c-chain-mem 999999)