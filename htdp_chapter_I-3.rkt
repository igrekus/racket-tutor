;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp_chapter_I-3) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
; ---
; Exercise 33
; Research "year 2000" problem.
; skip

; ---
; Exercise 34
; Design the function string-first, which extracts the first character from a non-empty string. Don’t worry about empty strings.

; String -> String
; extracts the first character from a given non-empty string
(check-expect (string-first "Hello world!") "H")
(check-expect (string-first "test") "t")

(define (string-first s)
  (substring s 0 1))

; ---
; Exercise 35
; Design the function string-last, which extracts the last character from a non-empty string.

; String -> String
; extracts the last character from a given non-empty string
(check-expect (string-last "Hello world!") "!")
(check-expect (string-last "test") "t")

(define (string-last s)
  (substring s (- (string-length s) 1)))

; ---
; Exercise 36
; Design the function image-area, which counts the number of pixels in a given image.

; Image -> Number
; Number represents the area of an input Image in pixels, or number of pixels in an input Image.
; computes the number of pixels in an input Image
(check-expect (image-area (circle 10 "solid" "red")) 400)

(define (image-area img)
  (* (image-width img) (image-height img)))

; ---
; Exercise 37
; Design the function string-rest, which produces a string like the given one with the first character removed.

; String -> String
; returns the input string with the first character removed
(check-expect (string-rest "Hello world!") "ello world!")
(check-expect (string-rest "test") "est")

(define (string-rest s) 
  (substring s 1))

; ---
; Exercise 38
; Design the function string-remove-last, which produces a string like the given one with the last character removed.

; String -> String
; returns the input string with the last character removed
(check-expect (string-remove-last "Hello world!") "Hello world")
(check-expect (string-remove-last "test") "tes")

(define (string-remove-last s)
  (substring s 0 (- (string-length s) 1)))

; ---
; Designing a world program
; 1. Introduce constants for unchanging objects

; physical constants
(define WIDTH-OF-WORLD 400)
(define HEIGHT-OF-WORLD 30)
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

; graphical constants
; Exercise 39
; draw a car using WHEEL-RADIUS as a single control point
(define BACKGROUND (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))
(define CAR-BODY (rectangle (* WHEEL-RADIUS 10) (* WHEEL-RADIUS 2) "solid" "red"))
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle (* WHEEL-RADIUS 2) WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define CAR (overlay/xy CAR-BODY (* WHEEL-RADIUS 2) (* WHEEL-RADIUS 2) BOTH-WHEELS))

(define X0 30)
(define Y0 20)

(define TREE-X (* (/ WIDTH-OF-WORLD 3) 2))
(define TREE-Y Y0)
(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

; finction wishlist
; render -- maps state to the representing image
; clock-tick-handler -- handles the state change in time
; keystroke-handler -- handles state reaction to user key input
; mouse-event-handler -- handles state reaction to user mouse input
; end? -- if needed, defines the state of the world that should signal the end of the program

; cw => WorldState is Number
; interpretation: the number of pixels between the left border of the scene and the leftmost pixel of the car

; Exercise 40
; Write test for functions
; WorldState -> Image
; main loop draws the image of the car x pixels from the left border of the BACKGROUND.
; (render cw)
(check-expect (render 0) (place-image CAR (+ X0 0) Y0
                                      (place-image TREE TREE-X TREE-Y BACKGROUND)))

(define (render cw)
  (place-image CAR (+ X0 cw) Y0
               (place-image TREE TREE-X TREE-Y BACKGROUND)))

; WorldState -> WorldState
; add 3 to x to move the car to the right
; (tock x)
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

(define (tock x)
  (+ x 3))

; WorldState -> WorldState
; for each user keystroke main loop obtains the next state of the world; ke represents the key
; (keystroke-handler cw ke)
(define (keystroke-handler cw ke) ...)

; WorldState Number Number String -> WorldState
; for each mouse gesture main loop obtains the next state of the world; x, y represent coordinates of the event, me represents event description
; (mouse-evemt-handler cw x y me)
(define (mouse-event-handler cw x y me) ...)

; WorldState -> Boolean
; after each event main loop determins if the program should stop
; (end? cw)
(define (end? cw)
  (< WIDTH-OF-WORLD cw))

; WorldState -> WorldState
; launches the program for initial state
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [stop-when end?]
    [to-draw render]))
