#lang racket

(define fac
  (lambda (n)
    (if (= n 0)
        1
        (* n (fac (- n 1))))))

(define (fac1 n)
  (if (= n 0)
      1
      (* n (fac1 (- n 1)))))
