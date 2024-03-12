#lang scheme
;Exercise 1.6

;ANS: Unlike the special form of "if", all the arguments under new-if procedure will be evaluated - hence, the procedure will keep on guessing.

;Ex 1.7

;ANS: since good enough is hard coded as a predetermined tolerance, very small numbers will exceed the tolerance threshold easily, causing inaccurate results.
; For very large numbers, there is limited precision such that some digits might not be stored in the memory, hence test will be inefficient, moreover, it takes a lot more iterations to get the guess of very large number to be below the threshold of 0.001 - very inefficient.

(define (good-enough? guess x)
  (< (abs(/ (- (improve guess x) guess) guess )) 0.0001)
;This alternative works better for relatively larger numbers as iterations improves the approximation.

;Ex 1.8

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
  guess
  (cbrt-iter (improve guess x) x)))

(define (improve guess x)
  (/ (/ x (+ (* guess guess) (* 2 guess)))) 3)

(define (good-enough? guess x)
  (<= (abs (- (cube guess) x)) 0.0001))

(define cube x)
  (* x x x)

; Refactored code above to using block structure and hence, exploiting x as a free variable within the block struct.
  

(define (cube x)
  (define (good-enough? guess)
    (<= (abs (- (cube guess) x)) 0.0001))
  (define (improve guess)
    (/ (/ x (+ (* guess guess) (* 2 guess)))) 3)
  (define (cbrt-iter guess)
    (if (good-enough? guess)
        guess
        (cbrt-iter (improve guess)))))

;Ex 1.9

 ;using sub method for the following,
 (define (+ a b)
   (if (= a 0) b (inc (+ (dec a) b))))
 ;struct would be as such
  (+ 4 5)
  (inc (+ 3 5))
  (inc (inc (+ 2 5)))
  (inc (inc (inc (+ 1 5))))
  (inc (inc (inc (inc (+ 0 5)))))
  (inc (inc (inc (inc 5))))
  (inc (inc (inc 6)))
  (inc (inc 7))
  (inc 8)
  9
 ;Recursive process - we need to "inc" after the recursive call, hence, there is a chain of deferred operation!

  ;using sub method for the following,
  (define (+ a b)
    (if (= a 0) b (+ (dec a) (inc b))))
  ;struct would be as such
  (+ 4 5)
  (+ 3 6)
  (+ 2 7)
  (+ 1 8)
  (+ 0 9)
  ;Iterative process - Recursive call (defined as same procedure - with different arguments) is the last thing we do!

;Ex 1.10 - Given A procedure
  (define (A x y)
    (cond ((= y 0) 0)
    ((= x 0) (* 2 y))
    ((= y 1) 2)
    (else (A (- x 1) (A x (- y 1))))))
  
;using sub method
  (A 1 10)
  (A 0 (A 1 9))
  (A (* 2 (A 1 9)))
  (A (* 2 (A 0 (A 1 8))))
  (A (* 2 (* 2 (A 1 8))))
  (A (* 2 (* 2 (A 0 (A 1 7)))))
  (A (* 2 (* 2 (* 2 (A 1 7)))))
  (A (* 2 (* 2 (* 2 (A 0 (A 1 6))))))
  (A (* 2 (* 2 (* 2 (* 2 (A 1 6))))))
  (A (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 5)))))))
  (A (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 5)))))))
  (A (* 2 (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 4)))))))
  (A (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 4))))))))
  ...
  (A (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 1)))))))))))
  (A (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 2)))))))))))
  ; (A 1 10) means 2^10 = 1024

;using sub method
  (A 2 4)
  (A 1 (A 2 3))
  (A 1 (A 1 (A 2 2)))
  (A 1 (A 1 (A 1 (A 2 1))))
  (A 1 (A 1 (A 1 2)))
  (A 1 (A 1 (A 0 (A 1 1))))
  (A 1 (A 1 (A 0 2)))
  (A 1 (A 1 (* 2 2)))
  (A 1 (A 1 4))
  (A 1 (A 0 (A 1 3)))
  (A 1 (A 0 (A 0 (A 1 2))))
  (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
  (A 1 (A 0 (A 0 (A 0 2))))
  (A 1 (A 0 (A 0 (* 2 2))))
  (A 1 (A 0 (A 0 4)))
  (A 1 (A 0 (* 2 4)))
  (A 1 (A 0 8))
  (A 1 (* 2 8))
  (A 1 16)
  ;Since (A 1 10) means 2^10 = 1024, (A 1 16) means 2^16 = 65536
  

  (A 3 3)
  (A 2 (A 3 2))
  (A 2 (A 2 (A 3 1)))
  (A 2 (A 2 2))
  (A 2 (A 1 (A 2 1)))
  (A 2 (A 1 2))
  (A 2 (A 0 (A 1 1)))
  (A 2 (A 0 2))
  (A 2 (* 2 2))
  (A 2 4)
  ;from example above, this expands to 2^16 = 65536
  
  
  
 ;(f n) computes 2n
 ;(g n) computes 2^n
 ;(h n) computes 2^(2^n)
 ;(k n) computes 5n^2
  
  
  
  
  
  
  
  
  
  
  
  


      