#lang racket

(define nums (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16))

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

(define (fbcompose n)
  (begin
    (define fizz
      (lambda (f)
        (if (= 0 (modulo n 3))
            (lambda (arg1)
              (string-append "Fizz" (f "")))
            f)))
    (define buzz
      (lambda (f)
        (if (= 0 (modulo n 5))
            (lambda (arg1)
              (string-append "Buzz" (f "")))
            f)))
    (define id
      (lambda (x)
        x))
    ((fizz (buzz id)) n)))

(define (fbdry n)
  (begin
    (define test
      (lambda (d s f)
        (if (= 0 (modulo n d))
            (lambda (arg1)
              (string-append s (f "")))
            f)))
    (define (fizz n)
      (test 3 "Fizz" n))
    (define (buzz n)
      (test 5 "Buzz" n))
    (define id
      (lambda (x)
        x))
    ((fizz (buzz id)) n)))

