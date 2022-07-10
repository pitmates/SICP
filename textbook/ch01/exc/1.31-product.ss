(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))


(define (product-iter term a next b)
  (define (iter a res)
    (if (> a b)
        res
        (iter (next a)
              (* res
                 (term a)))))
  (iter a 1))
    

; factorial
(define (factorial n)
  (define (identity x) x)
  (define (next x) (+ x 1))
  (product identity 1 next n))

(display "factorial")
(newline)
(display (factorial 5))
(newline)

(define (factorial-la n)
  (product (lambda (x) x)
           1
           (lambda (x) (+ x 1))
           n))

(display (factorial 6))
(newline)


; Pi
(define numer-iter
  (lambda (i)
    (cond ((= i 1)
           2)
          ((even? i)
           (+ i 2))
          (else (+ i 1)))))

(define denom-iter
  (lambda (i)
    (if (odd? i)
        (+ i 2)
        (+ i 1))))

(define (pi n)
  (* 4.
     (/ (product-iter numer-iter
                 1
                 (lambda (i) (+ i 1))
                 n)
        (product-iter denom-iter
                 1
                 (lambda (i) (+ i 1))
                 n))))
  
(display "pi")
(newline)
(display (pi 100))
(newline)
(display (pi 1000))
(newline)
(display (pi 10000))
(newline)
(display (pi 100000))
(newline)
(display (pi 1000000))
(newline)
  









(exit)