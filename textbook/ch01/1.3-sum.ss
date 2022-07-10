(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc x) (+ x 1))

; integers
(define (sum-integers a b)  
  (define (identity x) x)
  (sum identity a inc b))

(display "sum integers:")
(newline)
(display (sum-integers 3 10))
(newline)
(display (sum-integers 5 15))
(newline)

; cube
(define (sum-cube a b)
  (define (cube x) (* x x x))
  (sum cube a inc b))

(display "sum cube:")
(newline)
(display (sum-cube 3 5))
(newline)
(display (sum-cube 1 10))
(newline)


; pi-sum
(define (pi-sum a b)
  (define (pi-next x) (+ x 4))
  (define (pi-term x) (/ 1.
                         (* x (+ x 2))))
  (sum pi-term a pi-next b))


(display "sum pi:")
(newline)
(display (* 8 (pi-sum 1 10)))
(newline)
(display (* 8 (pi-sum 1 100)))
(newline)
(display (* 8 (pi-sum 1 1000)))
(newline)
(display (* 8 (pi-sum 1 10000)))
(newline)
(display (* 8 (pi-sum 1 10000000)))
(newline)
(exit)