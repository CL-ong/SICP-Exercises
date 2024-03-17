#lang scheme
;Ex 1.16

(define (square z) (* z z))

  
(define (fast-expt b n)
  (define (expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (expt-iter a (square b) (/ n 2)))
          (else (expt-iter (* a b) b (- n 1)))))
  (expt-iter 1 b n))



;Ex 1.17

;qn specifies "log number of steps" which indicates we need to repeatedly divide using the same integer

;recursive procedure

(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((= b even) (* (double a) (fast-mul a (halve b))))
        ((= b odd) (+ b (fast-mul a (- b 1))))))


;Ex 1.18

;translate above recursive proc. into iterative

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (fast-mul a b)
  (define (mul-iter result a b)
    (cond ((= b 0) result)
          ((even? b) (mul-iter result (double a) (halve b)))
          (else (mul-iter (* a b) a (- b 1)))))
  (mul-iter 0 a b))

;Ex 1.19

; a <- a + b
; b <- a

;Transformed according to
;p = 0
;q = 1

;a' = qb + qa + pa
;b' = pb + qa

;a'' = q (pb + qa) + q (qb + qa + pa) + p (qb + qa + pa) = a (p^2 + 2pq + 2q^2) + b (2pq + q^2) --- (1)
;b'' = p (pb + qa) + q (qb + qa + pa) = a (2pq + q^2) + b (p^2 + q^2) --- (2)

;a'' = q'b + q'a + p'a --- (3)
;b'' = p'b + q'a --- (4)

;Compare coefficients of a, b for (1) & (3) and (2) & (4) respetively, 
;q' = 2pq + q^2 -- compute p′
;p' = p^2 + q^2 -- compute q′

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q)) ; compute p′
                   (+ (* 2 p q) (* q q)) ; compute q′
                   (/ count 2)))
  (else (fib-iter (+ (* b q) (* a q) (* a p))
                  (+ (* b p) (* a q))
                  p
                  q
                  (- count 1)))))



