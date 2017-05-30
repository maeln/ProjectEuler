#lang racket

;(define (lprime? n l)
;  (= 0 (length (filter (lambda (b) (equal? b #t)) (map (lambda (x) (= 0 (modulo n x))) l)))))

;(define (prime-factors n)
;  (define (prec p f l)
;    (cond
;      [(empty? f) l]
;      [else (let ([x (first f)])
;              (prec (if (= 0 (modulo p x)) (/ p x) p) (rest f) (if (and (= 0 (modulo p x)) (lprime? x l)) (list* x l) l)))]))
;  (prec n (range 2 n) '()))

(define (prime-factors p)
  (define (prec n i)
    (if (= n 1)
        '()
        (let-values ([(q r) (quotient/remainder n i)])
          (if (= 0 r) (cons i (prec q i)) (prec n (+ 1 i))))))
  (prec p 2))

(prime-factors 600851475143)