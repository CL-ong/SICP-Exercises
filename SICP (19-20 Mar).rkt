#lang scheme
;Ex 1.28 - TBC

(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
     (remainder
      ((square (expmod base (/ exp 2) m))
      m)
     (define (result (remainder
      (square (expmod base (/ exp 2) m))
      ))
       (if (and (= (sqrt result) (or 1 (- n 1))) (not (= result (remainder 1 n))))
           return 0
     (else
     (remainder
      (* base (expmod base (- exp 1) m))
      m)))))))


(define mr-test n)
 (define try-it a)
(= (expmod a (- n 1)