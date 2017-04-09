#lang racket

(define (multof n x)
  (= (modulo x n) 0))

(define (multof35 until)
  (filter (lambda (x) (or (multof 3 x) (multof 5 x))) (stream->list (in-range until))))

(apply + (multof35 1000))