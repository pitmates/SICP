(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx))
                    (g x))
                 dx)))

(define (newton-trans  g)
  (lambda (x) (- x
                 (/ (g x)
                    ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-trans g) guess))

(define (fixed-point f x)
  (define tolerant 0.000001)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerant))
  (define (try guess)
    (let ((next (f guess)))
      (if (good-enough? guess next)
          next
          (try next))))
  (try 1.0))


(define (sqrt x)
  (define square
    (lambda (x) (* x x)))
  (newton-method (lambda (y) (- (square y) x))
                  1.0))

(display (sqrt 2.))
(newline)
(display (sqrt 3.))
(newline)
(display (sqrt 4.))


(exit)                 