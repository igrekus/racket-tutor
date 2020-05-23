#lang racket

(define nums (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))

(define (fn . xs)
  (begin
    (cond
      [(= 0 (modulo (first xs) 15)) (display "FizzBuzz\n")]
      [(= 0 (modulo (first xs) 3)) (display "Fizz\n")]
      [(= 0 (modulo (first xs) 5)) (display "Buzz\n")]
      [else (display (string-append (~v (first xs)) "\n"))])
    (cond
      [(> (length xs) 1) (apply fn (rest xs))])))

(define fizzbuzz
  (lambda (start [end 0])
    (if (= end 0)
        (cond
          [(= 0 (modulo start 15)) (display "FizzBuzz\n")]
          [(= 0 (modulo start 3)) (display "Fizz\n")]
          [(= 0 (modulo start 5)) (display "Buzz\n")]
          [else (display (string-append (~v start) "\n"))])
        (map fizzbuzz (range start end)))))

(define fb
  (lambda (start [end 0])
    (if (= end 0)
        (cond
          [(= 0 (modulo start 15)) "FizzBuzz"]
          [(= 0 (modulo start 3)) "Fizz"]
          [(= 0 (modulo start 5)) "Buzz"]
          [else (~v start)])
        (string-join (map fb (range start end)) "\n"))))
