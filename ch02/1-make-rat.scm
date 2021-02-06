
(define (make-rat n d)
    (if (< d 0)
        (cons (- n) (- d))
        (cons n d)
))

(display (make-rat 2 3))
(newline)
(display (make-rat 2 -3))
(exit)