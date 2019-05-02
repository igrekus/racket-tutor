;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp_chapter_I) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp")) #f)))
; ---
; Exercise 2

(define prefix "hello")
(define suffix "world")
; > (string-append prefix "_" suffix)

; ---
; Exercise 3

(define str "helloworld")
(define i 5)
; > (string-append (substring str 0 i) "_" (substring str i))

; ---
; Exercise 4

; > (string-append (substring str 0 (- i 1)) (substring str i))

; ---
; Exercise 5
(define (one-half value)
  (/ value 2))
(define (one-third value)
  (/ value 3))
(define (one-fifth value)
  (/ value 5))
(define (one-tenth value)
  (/ value 10))

(define (boat width height)
  (scene+line
   (scene+line
    (scene+line
     (scene+line
      (scene+line
       (scene+line
        (scene+line
         (empty-scene width height)
         (one-third width) (- height (one-tenth height)) (- width (one-third width)) (- height (one-tenth height)) "black")
        (one-fifth width) (- height (* (one-tenth height) 2)) (- width (one-fifth width)) (- height (* (one-tenth height) 2)) "black")
       (one-fifth width) (- height (* (one-tenth height) 2)) (one-third width) (- height (one-tenth height)) "black")
      (- width (one-fifth width)) (- height (* (one-tenth height) 2)) (- width (one-third width)) (- height (one-tenth height)) "black")
     (one-half width) (- height (* (one-tenth height) 2)) (one-half width) (- (one-half height) (one-tenth height)) "black")
    (one-half width) (- (one-half height) (one-tenth height)) (+ (one-half width) (one-tenth width)) (one-half height) "black")
   (+ (one-half width) (one-tenth width)) (one-half height) (one-half width) (+ (one-half height) (one-tenth height)) "black"))

; ---
; Exercise 6

(define (pix-count image)
  (* (image-width image) (image-height image)))

; ---
; Exercise 7

(define sunny #true)
(define friday #false)

(define (is-not-sunny val)
  (not (and val #true)))
(define (is-friday val)
  (and val #true))

(define (go-to-mall s f)
  (or (is-not-sunny s) (is-friday f)))

; ---
; Exercise 8

(define (tall-wide image)
  (if (= (image-width image) (image-height image))
      "square"
      (if (> (image-width image) (image-height image))
          "wide"
          "tall")))

; ---
; Exercise 9

(define (val-to-pos val)
  (if (string? val)
      (string-length val)
      (if (image? val)
          (* (image-width val) (image-height val))
          (if (number? val)
              (if (> val 0)
                  (- val 1)
                  val)
              (if (and val #true)
                  10
                  20)))))

; ---
; Exercise 116
; Take a look at the following sentences:
; Explain why they are syntactically legal expressions

; 1. x
; variable expression, prints the value bound to a variable

; 2. (= y z)
; primitive application on two variables

; 3. (= (= y z) 0)
; primitive application on an another primitive and a value

; ---
; Exercise 117
; Consider the following sentences:
; Explain why they are syntactically illegal.

; 1. (3 + 4)
; values cannot be applied or incorrect primitive application

; 2. number?
; incorrect function application, no parenthesis

; 3. (x)
; function application requires at least one variable

; ---
; Exercise 118
; Take a look at the following sentences:
; Explain why they are syntactically legal definitions

; 1. (define (f x) x)
; defines a function, wich takes one parameter and returns taken parameter

; 2. (define (f x) y)
; defines a function, wich takes one parameter and returns a variable from outer scope

; 3. (define (f x y) 3)
; defines a function, wich takes two parameters and returns a value

; ---
; Exercise 119
; Consider the following sentences:
; Explain why they are syntactically illegal.

; 1. (define (f "x") x)
; illegal function definition, uses value for parameter

; 2. (define (f x y z) (x))
; error in function body, incorrectly tries to apply variable

; ---
; Exercise 120
; Discriminate the legal from the illegal sentences:
; Explain why the sentences are legal or illegal. Determine whether the legal ones belong to the category expr or def.

; 1. (x)
; illegal, function application without parameter

; 2. (+ 1 (not x))
; illegal, second parameter type mismatch

; 3. (+ 1 2 3)
; legal, expr, primitive application

; ---
; Exercise 121
; Evaluate the following expressions step-by-step:
; Use DrRacket’s stepper to confirm your computations.

; 1.
;(+ (* (/ 12 8) 2/3) (- 20 (sqrt 4))) -> (+ (* 3/2  2/3) (- 20 (sqrt 4))) -> (+ 1 (- 20 (sqrt 4))) -> (+ 1 (- 20 2)) -> (+ 1 18) -> 19

; 2.
;(cond
;  [(= 0 0) #false]
;  [(> 0 1) (string=? "a" "a")]
;  [else (= (/  1 0) 9)])
; ->
;(cond
;  [#true #false]
;  [(> 0 1) (string=? "a" "a")]
;  [else (= (/  1 0) 9)])
; -> #false

; 3.
; (cond
;   [(= 2 0) #false]
;   [(> 2 1) (string=? "a" "a")]
;   [else (= (/  1 2) 9)]) 
; ->
; (cond
;   [(> 2 1) (string=? "a" "a")]
;   [else (= (/  1 2) 9)])
; ->
; (string=? "a" "a")
; -> #true

; ---
; Exercise 122. Suppose the program contains these definitions:

; (define (f x y)
;   (+ (* 3 x) (* y y)))

; Show how DrRacket evaluates the following expressions, step-by-step:

; (+ (f 1 2) (f 2 1)) -> (+ (+ (* 3 1) (* 2 2)) (f 2 1)) -> (+ (+ 3 (* 2 2)) (f 2 1)) -> (+ (+ 3 4) (f 2 1)) -> (+ 7 (f 2 1)) -> (+ 7 (+ (* 3 2) (* 1 1))) -> (+ 7 (+ 6 (* 1 1))) -> (+ 7 (+ 6 1)) -> (+ 7 7) -> 14

; (f 1 (* 2 3)) -> (f 1 6) -> (+ (* 3 1) (* 6 6)) -> (+ 3 (* 6 6)) -> (+ 3 36) -> 39

; (f (f 1 (* 2 3)) 19) -> (f (f 1 6) 19) -> (f (+ (* 3 1) (* 6 6)) 19) -> (f (+ 3 (* 6 6)) 19) -> (f (+ 3 36) 19) -> (f 39 19) -> (+ (* 3 39) (* 19 19)) -> (+ 117 (* 19 19)) -> (+ 117 361) -> 478

; ---
; Exercise 123
; Write down a rule that shows how to reformulate
;   (if exp-test exp-then exp-else)
;
; as a cond expression:
; 
;(cond
;  [exp-test exp-then]
;  [else exp-else])

; ---
; Exercise 124
;
; 1. Evaluate the following program, step-by-step:
; (define PRICE 5)
; (define SALES-TAX (* 0.08 PRICE))
; (define TOTAL (+ PRICE SALES-TAX))
; ->
; (define PRICE 5)
; (define SALES-TAX (* 0.08 5))
; (define TOTAL (+ PRICE SALES-TAX))
; ->
; (define PRICE 5)
; (define SALES-TAX 0.4)
; (define TOTAL (+ PRICE SALES-TAX))
; ->
; (define PRICE 5)
; (define SALES-TAX 0.4)
; (define TOTAL (+ 5 SALES-TAX))
; ->
; (define PRICE 5)
; (define SALES-TAX 0.4)
; (define TOTAL (+ 5 0.4))
; ->
; (define PRICE 5)
; (define SALES-TAX 0.4)
; (define TOTAL 5.4)
;
; 2. Does the evaluation of the following program signal an error?
; (define COLD-F 32)
; (define COLD-C (fahrenheit->celsius COLD-F))
; (define (fahrenheit->celsius f)
;   (* 5/9 (- f 32)))
; error, fahrenheit->celsius is used before definition
;
; 3. How about the next one?
; (define LEFT -100)
; (define RIGHT 100)
; (define (f x) (+ (* 5 (expt x 2)) 10))
; (define f@LEFT (f LEFT))
; (define f@RIGHT (f RIGHT))
; no error, correct definition order

; ---
; Exercise 125
; Discriminate the legal from the illegal sentences, explain why the sentences are legal or illegal. 
;
; 1. (define-struct oops [])
; legal, sequence of variables in square parentheses can be empty
;
; 2. (define-struct child [parents dob date])
; legal, correct struct definition
;
; 3. (define-struct (child person) [dob date])
; illegal, function application in place of variable

; ---
; Exercise 126
; Identify the values among the following expressions, assuming the definitions area contains these structure type definitions. Explain why the expressions are values or not. 
; (define-struct point [x y z])
; (define-struct none [])
;
; 1. (make-point 1 2 3) -> point value with x=1 y=2 z=3
;
; 2. (make-point (make-point 1 2 3) 4 5) -> point value with x=point(1 2 3) y=2 z=3
;
; 3. (make-point (+ 1 2) 3 4) -> point value with x=1+2 y=3 z=4
;
; 4. (make-none) -> none value, empty parentheses allowed
;
; 5. (make-point (point-x (make-point 1 2 3)) 4 5) -> point value x evaluates to 1

; ---
; Exercise 127
; Suppose the program contains 
; (define-struct ball [x y speed-x speed-y])
;
; Predict the results of evaluating the following expression. Explain prediction.
;
; (number? (make-ball 1 2 3 4)) -> #false, make-ball produces a struct wich is not a number
;
; (ball-speed-y (make-ball (+ 1 2) (+ 3 3) 2 3)) -> 3, extracs speed-y variabl from ball struct, wich is 3 here
;
; (ball-y (make-ball (+ 1 2) (+ 3 3) 2 3)) -> 6, extracts y variable from ball struct, wich is 6 here
;
; (ball-x (make-posn 1 2)) -> error, ball-x expects a ball struct parameter, but posn struct is given
;
; (ball-speed-y 5) -> error, ball-speed-y expects a ball struct parameter, but number 5 is given

; ---
; Exercise 128
; Copy the following tests into DrRacket’s definitions area.
; Validate that all of them fail and explain why.
; (check-member-of "green" "red" "yellow" "grey") -> "green" is not equal? with any given value
; (check-within (make-posn #i1.0 #i1.1)
;               (make-posn #i0.9 #i1.2) 0.01) -> posn(#i1.0 #i1.1) is not equal? to posn(#i0.9 #i1.2) with tolerance of 0.01
; (check-range #i0.9 #i0.6 #i0.8) -> #i0.9 is not equal? to any of the values from the interval [#i0.6..#i0.8)
; (check-random (make-posn (random 3) (random 9))
;               (make-posn (random 9) (random 3))) -> random is applied to different intervals on both occurences, wich yields different result
; (check-satisfied 4 odd?) -> test case fails to satisfy the predicate since 4 is even and predicate check wether a number is odd
