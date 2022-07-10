(define (double f)
  (lambda (x) (f (f x))))

(display (((double (double double)) 1+) 5))
(exit)