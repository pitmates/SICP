(define (display-info step value)
  (display "step: ")
  (display step)
  (display "  value: ")
  (display value)
  (newline))

(define tolerant 0.000001)

(define (fixed-point f x)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerant))
  (define (try guess step)
    (display-info step guess)
    (let ((next (f guess)))
      (if (good-enough? guess next)
          (begin
            (display-info (+ 1 step next))
            next)
          (try next (+ 1 step)))))
  (try x 1))

(define formula
  (lambda (x) (/ (log 1000.)
                 (log x))))

(define average
  (lambda (x y)
    (/ (+ x y) 2.)))

(define (average-damp f)
  (lambda (x) (average (f x)
                       x)))


; (display "pure formula:\n")
; (fixed-point formula 2.0)
; (newline)

; (display "damp formula:\n")
; (fixed-point (average-damp formula) 2.)

; (exit)
  
