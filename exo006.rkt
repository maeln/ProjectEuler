#lang racket

(- (expt (apply + (range 1 101)) 2) (apply + (map (lambda (x) (expt x 2)) (range 1 101))))