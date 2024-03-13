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

;Ex 1.14 - KIV
; (cc n 1) generates (* 2 n) steps, with 
        
;Ex 1.15
;a. 5 times
;b. KIV




      
  



             