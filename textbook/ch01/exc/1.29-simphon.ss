(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (simphon f a b n)
  (define h ( / (- b a) n))
  (define (y k) (f (+ a (* h k))))
  (define (factor x)
    (cond ((or (= x 0) (= x n))
          1)
          ((even? x)
           2)
          (else
           4)))
  (define (s-term x)
    (* (factor x)
       (y x)))
  (define (next x) (+ x 1))
  (if (odd? n)
      (error "invalid n, must be even")
      (* (/ h 3.)
         (sum s-term 0. next n))))


; test
(define (cube x) (* x x x))
(define (sq x) (* x x))

(display "cube:")
(newline)
(display (simphon cube 0 1 100))
(newline)
(display (simphon cube 0 1 1000))
(newline)

(display "SQ:")
(newline)
(display (simphon sq 0 1 100))
(newline)
(display (simphon sq 0 1 1000))
(newline)

(exit)
