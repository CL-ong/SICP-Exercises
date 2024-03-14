#lang scheme

;Ex 1.11

;recursive process below;

(define (f n)
  (if
   (< n 3) n
   (>= n 3) (+ (f (- n 1)) (* 2 (f (- n 2)) (* 3 (f (- 3 n)))))))

;iterative process below

(define (f n)
  (define (f-iter a b c count)
   (cond ((< n 3) n)
         ((<= count 0) a)
         (else (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))))
  (f-iter 2 1 0 (- n 2)))       
         

;Ex 1.12

1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
1 5 10 10 5 1
1 6 15 20 15 6 1
1 7 21 35 35 21 7 1

;each rows have same number of columns
;col 1 has value of 1, col of row no. has value of 1

(define (p col row)
  (if (or (= col 0) (= col row))
      1
      (+ (p (- col 1) (- row 1)) (p col (- row 1)))))

;Ex 1.13
;proof by induction

;Ex 1.14 
; (cc n 1) generates (* 2 n) steps, thus number of steps for (cc 11 1) needs 22 steps.
; Hence, order of growth for both number of steps & space is O(n).
        
;Ex 1.15
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
;a is ran 5 times
;b.

(sine 12.15)
(sine (/ 12.15 3.0))
(sine 4.05)
(sine (/ 4.05 3.0))
(sine 1.35)
(sine (/ 1.35 3.0))
(sine 0.45)
(sine (/ 0.45 3.0))
(sine 0.15)
(sine (/ 0.15 3.0))
(sine 0.05)

      

;For order of growth of space, at each point in the process, we just need to keep track of the parent node of the current node, hence, O(n) as space grows linearly.
;for order of growth of steps, KIV




      
  



             