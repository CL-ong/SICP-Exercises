#lang scheme
; Exercise 1.1
10
;10
(+ 5 3 4)
;12
(- 9 1)
;8
(/ 6 2)
;3
(+ (* 2 4) (- 4 6))
;6
(define a 3)
;a
(define b (+ a 1))
;b
(+ a b (* a b))
;19
(= a b)
;#f
(if (and (> b a) (< b (* a b)))
b
a)
;4
(cond ((= a 4) 6)
((= b 4) (+ 6 7 a))
(else 25))
;16
(+ 2 (if (> b a) b a))
;4+2=6
(* (cond ((> a b) a)
((< a b) b)
(else -1))
(+ a 1))
;16

; Exercise 1.2
;Translate the following expression into prefix
;form:

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;Exercise 1.3: Define a procedure that takes three numbers
;as arguments and returns the sum of the squares of the two
;larger numbers.

(define square x (* x x))
(define square-sum a b c)
 (cond (and (>= a c) (>= b c)) (+ (square a) (square b))
      (and (>= a b) (>= c b)) (+ (square a) (square c))
      (and (>= b a) (>= c a)) (+ (square b) (square c)))

;Exercise 1.4: Observe that our model of evaluation allows
;for combinations whose operators are compound expressions. Use this observation to describe the behavior of the
;following procedure:

;(define (a-plus-abs-b a b)
;((if (> b 0) + -) a b))

; ANS: a + b when (> b 0), a - b when (< b 0)


;Exercise 1.5

; ANS : In applicative order, arguments are evaluated before procedure is applied, hence p would evaluate to p repeatedly - and would not terminate


