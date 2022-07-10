(define (cube-root x)
    (cube-iter 1.0 x))

(define (cube-iter guess x)
    (if (good? guess x)
        guess
        (cube-iter (improve guess x) x)))



(define (sq x) (* x x))

(define (cube x) (* x x x))

(define (good? guess x)
    (> 0.001
        (abs(- (cube guess) x))))

(define (improve guess x)
        (/ (+ (/ x (sq guess)) (* 2 guess))
            3))


(display (cube-root (* 3 3 3)))
(newline)
(display (cube-root (* 7 7 7)))
(exit)