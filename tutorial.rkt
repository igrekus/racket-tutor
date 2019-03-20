#lang slideshow

(define (extract3 str start)
  (substring str start (+ start 3)))

(define c (circle 10))
(define r (rectangle 10 20))

(define (square n)
  ; defining a commented function
  (filled-rectangle n n))

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


