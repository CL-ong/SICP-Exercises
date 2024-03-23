#lang scheme
;Ex 1.28

;my attempt
(define (test x)
  (if (and (or (= (sqrt x) (not 1)) (= (sqrt x) (not (- (sqrt x) 1)))) (= x (remainder 1 n)))
      (return 0)
      (false)
      

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (test (remainder
          (square (expmod base (/ exp 2) m))
          m)))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (mr-test n)
 (define (try-it a)
   (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

;solution

(define (square x) (* x x))


(define (expmod1 base exp m)
    (define (test x)
        (cond ((or (= x 1) (= x (- m 1))) 1)
              ((= 1 (remainder (square x) m)) 0)
              (else (remainder (square x) m))))
    (cond ((= exp 0) 1)
          ((even? exp) (test (expmod1 base (/ exp 2) m)))
          (else
           (remainder (* base (expmod1 base (- exp 1) m))
                      m))))

(define (miller-rabin-test n)
    (define (try-it a)
        (= (expmod1 a (- n 1) n) 1))
    (try-it (+ 1 (random (- n 2)))))

(define (fast-miller-rabin-prime? n times)
    (cond ((= times 0) true)
          ((miller-rabin-test n) (fast-miller-rabin-prime? n (- times 1)))
          (else false)))

