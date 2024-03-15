#lang scheme
;Exercise 1.16

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
;translate above proc. into iterative

(define (fast-mul a b)
  (define (mul-iter result a b)
    (cond ((= b 0) result)
          ((even? b) (mul-iter result (double a) (halve b)))
          (else (mul-iter (* a b) (- b 1)))))
  (mul-iter 0 a b))
        