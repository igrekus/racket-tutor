;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp_chapter_I) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp")) #f)))
; Exercise 2

(define prefix "hello")
(define suffix "world")
; > (string-append prefix "_" suffix)

; Exercise 3

(define str "helloworld")
(define i 5)
; > (string-append (substring str 0 i) "_" (substring str i))

; Exercise 4

; > (string-append (substring str 0 (- i 1)) (substring str i))

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

; Exercise 6

(define (pix-count image)
  (* (image-width image) (image-height image)))

; Exercise 7

(define sunny #true)
(define friday #false)

(define (is-not-sunny val)
  (not (and val #true)))
(define (is-friday val)
  (and val #true))

(define (go-to-mall s f)
  (or (is-not-sunny s) (is-friday f)))

; Exercise 8

(define (tall-wide image)
  (if (= (image-width image) (image-height image))
      "square"
      (if (> (image-width image) (image-height image))
          "wide"
          "tall")))

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
