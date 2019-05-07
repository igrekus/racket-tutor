;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp_chapter_I-3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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
(check-expect (string-first "Hello world!") "!")
(check-expect (string-first "test") "t")

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
(check-expect (string-first "Hello world!") "ello world!")
(check-expect (string-first "test") "est")

(define (string-rest s) 
  (substring s 1))

; ---
; Exercise 38
; Design the function string-remove-last, which produces a string like the given one with the last character removed.

; String -> String
; returns the input string with the last character removed
(check-expect (string-first "Hello world!") "Hello world")
(check-expect (string-first "test") "tes")

(define (string-remove-last s)
  (substring s 0 (- (string-length s) 1)))
