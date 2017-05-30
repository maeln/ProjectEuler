#lang racket

(define (pythagorean? a b c)
  (and (< a b c) (= (+ (expt a 2) (expt b 2)) (expt c 2))))

(apply * (for*/last ([c (in-naturals)]
            [b (in-range 0 c)]
            [a (in-range 0 b)])
  #:final (and (pythagorean? a b c) (= 1000 (+ a b c)))
  (list a b c)))