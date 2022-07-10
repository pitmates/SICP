(define (display-info step value)
  (display "step: ")
  (display step)
  (display "  value: ")
  (display value)
  (newline))

; iter
(define (cont-frac n d k)
  (define (iter k pred)
    (display-info k pred)
    (let ((pre (+ (/ (n k)
              (+ (d k) pred)))))
      (if (< k 1)
          pred
          (iter (- k 1) pre))))
  (iter k 0))

; ( display (cont-frac (lambda (i) 1.0)
;                      (lambda (i) 1.0)
;                      20))

; rec
(define (cont n d k)
  (define (f i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i)
           (+ (d i) (f (+ i 1))))))
  (f 1))

(newline)
(display (cont (lambda (i) 1.0)
               (lambda (i) 1.0)
               20))


(exit)
  