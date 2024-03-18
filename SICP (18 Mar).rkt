#lang scheme

;Ex 1.22


;KIV, need a workaround for primitive implementation of "runtime" as it does not exist here

;Ex 1.23

(define (next x)
  cond ((= x 2) (3)
       (else (+ x 2))))

;KIV, related to Ex 1.22

;Ex 1.24
;KIV, related to ex 1.22

;Ex 1.25
;KIV related to ex 1.22

;Ex 1.26
;Using applicative order, square procedure only needs to evaluate its argument once instead of 2 times

;ex 1.27

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (congruent? a)
  (define (congruent-test n a)
    (cond ((= n a) true)
        ((= (expmod a n n) a) (congruent-test n (+ a 1))
        (else false)))
    (congruent-test n 2)