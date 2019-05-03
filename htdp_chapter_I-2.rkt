;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp_chapter_I-2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp")) #f)))
; ---
; Exercise 11
; Define a function that consumes two numbers, x and y, and that computes the distance of point (x,y) to the origin.

(define (distance-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))

; ---
; Exercise 12
; Define the function cvolume, which accepts the length of a side of an equilateral cube and computes its volume. If you have time, consider defining csurface, too.

(define (cvolume side)
  (* side (* side side)))

; ---
; Exercise 13
; Define the function string-first, which extracts the first 1String from a non-empty string.

(define (string-first s)
  (if (> (string-length s) 0)
      (substring s 0 1)
      (error "input string cannot be empty")))

; ---
; Exercise 14
; Define the function string-last, which extracts the last 1String from a non-empty string.

(define (string-last s)
  (if (> (string-length s) 0)
      (substring s (- (string-length s) 1))
      (error "input string cannot be empty")))

; ---
; Exercise 15
; Define ==>. The function consumes two Boolean values, call them sunny and friday. Its answer is #true if sunny is #false or friday is #true.
; Note Logicians call this Boolean operation implication, and they use the notation sunny => friday for this purpose.

(define (==> sunny friday)
  (or (not (and sunny #true)) (and friday #true)))

; ---
; Exercise 16
; Define the function image-area, which counts the number of pixels in a given image. See exercise 6 for ideas.

(define (image-area img)
  (* (image-width img) (image-height img)))

; ---
; Exercise 17
; Define the function image-classify, which consumes an image and conditionally produces
; "tall" if the image is taller than wide,
; "wide" if it is wider than tall, or
; "square" if its width and height are the same.

(define (image-classify img)
  (cond
    [(= (image-width img) (image-height img)) "square"]
    [(> (image-width img) (image-height img)) "wide"]
    [(< (image-width img) (image-height img)) "tall"]))

; ---
; Exercise 18
; Define the function string-join, which consumes two strings and appends them with "_" in between.

(define (string-join s1 s2)
  (string-append s1 "_" s2))

; ---
; Exercise 19
; Define the function string-insert, which consumes a string str plus a number i and inserts "_" at the ith position of str.
; Assume i is a number between 0 and the length of the given string (inclusive).
; Ponder how string-insert copes with "".

(define (string-insert s i)
  (string-append (substring s 0 i) "_" (substring s i)))

; ---
; Exercise 20
; Define the function string-delete, which consumes a string plus a number i and deletes the ith position from str.
; Assume i is a number between 0 (inclusive) and the length of the given string (exclusive).
; Can string-delete deal with empty strings?

(define (string-delete s i)
  (string-append (substring s 0 i) (substring s (+ i 1))))

; ---
; Exercise 21

(define (ff a)
  (* 10 a))

; Use DrRacket’s stepper to evaluate (ff (ff 1)) step-by-step. Also try (+ (ff 1) (ff 1)). Does DrRacket’s stepper reuse the results of computations?
; (ff (ff 1)) -> (ff (* 10 1)) -> (ff 10) -> (* 10 10) -> 100
; (+ (ff 1) (ff 1)) -> (+ (* 10 1) (ff 1)) -> (+ 10 (ff 1)) -> (+ 10 (* 10 1)) -> (+ 10 10) -> 20, does not reuse computations

; --
; Exercise 22
; Use DrRacket’s stepper on this program fragment:
; (distance-to-origin 3 4) -> (sqrt (+ (sqr 3) (sqr 4))) -> (sqrt (+ 9 (sqr 4))) -> (sqrt (+ 9 16)) -> (sqrt 25) -> 5

; --
; Exercise 23
; How does the result of this function is computed?
; (string-first "hello world") -> (substring "hello world" 0 1) -> "h"

; ---
; Exercise 24
; Use the stepper to determine the value of (==> #true #false)
; (==> #true #false) -> (==> #true #false) -> (or (not (and #true #true)) (and #false #true)) -> (or (not #true) (and #false #true)) -> (or #false (and #false #true)) -> (or #false #false) -> #false

; ---
; Exercise 25
; Take a look at this attempt to solve exercise 17:
; Does stepping through an application suggest a fix? 
; (define (image-class img)
;   (cond
;     [(>= (image-height img) (image-width img)) "tall"]
;     [(= (image-height img) (image-width img)) "square"]
;     [(<= (image-height img) (image-width img)) "wide"]))
; -> fix
; (define (image-class img)
;   (cond
;     [(> (image-height img) (image-width img)) "tall"]
;     [(= (image-height img) (image-width img)) "square"]
;     [(< (image-height img) (image-width img)) "wide"]))

; ---
; Exercise 26
; What do you expect as the value of this program.
; Confirm your expectation with DrRacket and its stepper.
; (string-insert "helloworld" 6) -> (string-append (substring "helloworld" 0 6) "_" (substring "helloworld" 6)) -> (string-append "hellow" "_" "orld") -> "hellow_orld"

; ---
; Movie theater

(define BASE-ATTENDANCE 120)
(define BASE-TICKET-PRICE 5.0)
(define BASE-COST 180)
(define PER-ATTENDEE-COST 0.04)
(define ATTENDEES-TO-PRICE-RATE (/ 15 0.1))

(define (attendees ticket-price)
  (- BASE-ATTENDANCE (* (- ticket-price BASE-TICKET-PRICE) ATTENDEES-TO-PRICE-RATE)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ BASE-COST (* PER-ATTENDEE-COST (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

; Exercise 27
; Refactor constant definitions in the above program

; Exercise 28
; Determine the potential profit for these ticket prices: $1, $2, $3, $4, and $5.
; Which price maximizes the profit of the movie theater? Determine the best ticket price to a dime.
;
; (profit 5) -> 415.2
; (profit 4) -> 889.2
; (profit 3) -> 1063.2
; (profit 2) -> 937.2
; (profit 1) -> 511.2
; (profit 2.9) -> 1064.1 (max profit)

(define (profit-alt price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

; Enter this definition into DrRacket and ensure that it produces the same results as the original version for $1, $2, $3, $4, and $5.

; (check-expect (profit 5) (profit-alt 5)) -> pass
; (check-expect (profit 4) (profit-alt 4)) -> pass
; (check-expect (profit 3) (profit-alt 3)) -> pass
; (check-expect (profit 2) (profit-alt 2)) -> pass
; (check-expect (profit 1) (profit-alt 1)) -> pass

; Exercise 29
; After studying the costs of a show, the owner discovered several ways of lowering the cost.
; As a result of these improvements, there is no longer a fixed cost; a variable cost of $1.50 per attendee remains.
; Modify both programs to reflect this change.
; When the programs are modified, test them again with ticket prices of $3, $4, and $5 and compare the results. 

(define PER-ATTENDEE-COST-NEW 1.5)

(define (cost-new ticket-price)
  (* PER-ATTENDEE-COST-NEW (attendees ticket-price)))

(define (profit-new ticket-price)
  (- (revenue ticket-price) (cost-new ticket-price)))

(define (profit-alt-new price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
        (* 1.5
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price))))))

; (check-expect (profit-new 5) (profit-alt-new 5)) -> pass
; (check-expect (profit-new 4) (profit-alt-new 4)) -> pass
; (check-expect (profit-new 3) (profit-alt-new 3)) -> pass
