
(define tolerant 0.000001)
(define (fix-point f guess)
  (define (small-enough? v1 v2)
    (< (abs (- v1 v2)) tolerant))
  (define (try guess)
    (let ((next (f guess)))
      (if (small-enough? guess next)
          next
          (try next))))
  (try guess))

(display (fix-point (lambda (x) (+ 1 (/ 1. x)))
                    1.0))


(exit)