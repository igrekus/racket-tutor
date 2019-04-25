;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp_chapter_I) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp")) #f)))
; Excersize 2

(define prefix "hello")
(define suffix "world")
; > (string-append prefix "_" suffix)

; Excersize 3

(define str "helloworld")
(define i 5)
; > (string-append (substring str 0 i) "_" (substring str i))

; Excersize 4

; > (string-append (substring str 0 (- i 1)) (substring str i))