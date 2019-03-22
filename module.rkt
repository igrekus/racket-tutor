#lang slideshow

(define (square n)
  ; defining a commented function
  (filled-rectangle n n))

(define (rainbow what)
  (map (lambda (color)
         (colorize what color))
       (list "red" "orange" "yellow" "green" "blue" "purple")))

(provide rainbow square)
