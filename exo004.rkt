#lang racket

(define (palindrome? s)
  (equal? s (list->string (reverse (string->list s)))))

(apply max (for*/list ([x (in-range 100 1000)]
                       [y (in-range 100 1000)])
             (let ([s (* x y)])
               (if (palindrome? (number->string s)) s 0))))
