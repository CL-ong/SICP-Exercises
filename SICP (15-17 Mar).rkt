#lang scheme
;Ex 1.20
;For normal order

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)) ; (gcd 40 6)
 
(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40) (remainder (40 (remainder 206 40))))) ; (gcd 6 4)

;(gcd (remainder 206 40) (remainder (40 (remainder 206 40))))

(if (= (remainder (40 (remainder 206 40))) 0)
    (remainder 206 40)
    (gcd (remainder (40 (remainder 206 40))) (remainder (remainder 206 40) (remainder (40 (remainder 206 40)))))) ; (gcd 4 2)

;(gcd (remainder (40 (remainder 206 40))) (remainder (remainder 206 40) (remainder (40 (remainder 206 40)))))) 

(if (= (remainder (remainder 206 40) (remainder (40 (remainder 206 40)))) 0)
    (remainder (40 (remainder 206 40)))
    (gcd (remainder (remainder 206 40) (remainder (40 (remainder 206 40)))) (reaminder (remainder (40 (remainder 206 40))) (remainder (remainder 206 40) (remainder (40 (remainder 206 40)))))))

;For applicative order

(gcd 206 40)

(gcd 40 6)

(gcd 6 4)

(gcd 4 2)

(gcd 2 0) ;remainder called 4 times in total

;Ex 1.21

; Ans: 199, 1999, 7

;Ex 1.22

