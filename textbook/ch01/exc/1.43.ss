(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x)
        (let ((fn (repeated f (- n 1))))
          (f (fn x))))))

(define (repeated-la f n)
  (if (= n 1)
      f
      (lambda (x) (f ((repeated-la f (- n 1)) x)))))


(define (repeated-it f n)
  (define (iter i fi)
    (if (= i 1)
        fi
        (iter (- i 1)
              (lambda (x)
                (f (fi x))))))
  (iter n f))

(define (square x) (* x x))

(display ((repeated square 2) 5))
(newline)
(display ((repeated-it square 2) 5))
(newline)
(display ((repeated-la square 2) 5))
(newline)
(exit)