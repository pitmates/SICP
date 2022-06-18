(define (make-vector x y) (cons x y))
(define (xcor p) (car p))
(define (ycor p) (cdr p))

(define (make-seg p q) (cons p q))
(define (seg-start s) (car s))
(define (seg-end s) (cdr s))

(define (midpoint s)
  (let ((a (seg-start s))
        (b (seg-end s)))
    (make-vector
     (average (xcor a) (xcor b))
     (average (ycor a) (ycor b)))))

(define (length s)
  (let ((dx (- (xcor (seg-start s)) (xcor (seg-end s))))
        (dy (- (ycor (seg-start s)) (ycor (seg-end s)))))
    (sqrt (+ (square dx)
             (square dy)))))
