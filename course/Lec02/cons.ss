(define (+vect v1 v2)
  (make-vector
   (+ (xcor v1) (xcor v2))
   (+ (ycor v1) (ycor v2))))


(define (scale s v)
  (make-vector
   (* s (xcor v))
   (* s (ycor v))))

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
