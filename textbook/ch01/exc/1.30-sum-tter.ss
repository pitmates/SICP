(define (sum term a next b)
  (define (iter a result)
    (if (< b a)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))


; test

(display (sum (lambda (x) x)
              1
              (lambda (y) (+ 1 y))
              10))
(newline)
(exit)


