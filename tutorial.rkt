#lang slideshow

(define (extract3 str start)
  (substring str start (+ start 3)))

(define c (circle 10))
(define r (rectangle 10 20))

(define (four what)
  (define two-p (hc-append what what))
  (vc-append two-p two-p))

(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))

(define (checkerboard what)
  (let* ([red-what (colorize what "red")]
         [black-what (colorize what "black")]
         [rb-what (checker red-what black-what)]
         [four-what (four rb-what)])
    (four four-what)))

(define (series what)
  (hc-append 5 (what 5) (what 10) (what 20)))

(define (rgb-series what)
  (vc-append
   (series (lambda (size) (colorize (what size) "red") ))
   (series (lambda (size) (colorize (what size) "green") ))
   (series (lambda (size) (colorize (what size) "blue") ))
   ))

(define (rgb-maker what)
  (lambda (size)
    (vc-append (colorize (what size) "red")
               (colorize (what size) "green")
               (colorize (what size) "blue"))))

(define (привет имя)
  (display "Привет, ")
  (display имя)
  (display "!"))
(define (пользователь)
  (write "Представьтесь: ")
  (read))

(define (abs x)
  (if (> x 0) x (- x)))

(define (fact-rec x)
  (if (= x 0)
      1
      (* x (fact-rec (- x 1)))))

(define (fact-iter x)
  (define (iter fun result count)
    (if (= count 0)
        result
        (iter fun (fun result count) (- count 1))))
  (iter * 1 x))

(define (pow-rec what pow)
  (if (= pow 1)
      what
      (* what (pow-rec what (- pow 1)))))

(define (pow-iter what pow)
  (define (iter result count)
    (if (= count 1)
        result
        (iter (* result what) (- count 1))))
  (iter what pow))

(require pict/flash)

(require "module.rkt")

(define (fib-rec-up num)
  (define (fib prev cur)
    (if (> cur num)
        (display "stop")
        (begin (display cur)
               (display "\n")
               (fib cur (+ cur prev)))))
  (fib 0 1))

(define (fib-find num)
  (if (< num 2)
      num
      (+ (fib-find (- num 1)) (fib-find (- num 2)))))

(define (fib-iter-first n)
  (define (iter n a b)
    (display b)
    (display "\n")
    (if (= n 0)
        a
        (if (= n 1)
            b
            (iter (- n 1) b (+ a b)))))
  (iter n 0 1))

(require slideshow/code)

(define-syntax pict+code
  (syntax-rules ()
    [(pict+code expr)
     (hc-append 10
                expr
                (code expr))]))

(require racket/class)
(require racket/gui/base)

(define f (new frame%
               [label "yeeee"]
               [width 300]
               [height 200]
               [alignment '(center center)]))

(define (add-drawing what)
  (let ([drawer (make-pict-drawer what)])
    (new canvas%
         [parent f]
         [style '(border)]
         [paint-callback (lambda (self dc)
                           (drawer dc 0 0))])))
