(define 1-To-4 (list 1 2 3 4))

(display (car (cdr 1-To-4)))
(newline)

(define nil '())

(define (scale-list s l)
  (if (null? l)
      nil
      (cons (* (car l) s)
            (scale-list s (cdr l)))))

(display (car (cdr (scale-list 10 1-To-4))))
(newline)


(define (map p l)
  (if (null? l)
      nil
      (cons (p (car l))
            (map p (cdr l)))))

(define (scale-list2 s l)
  (map (lambda (item) (* item s))
         l))

(display (car (map (lambda (x) (+ x 10)) 1-To-4)))
(newline)


(define (for-each proc list)
  (cond ((null? list) "done")
        (else (proc (car list))
              (for-each proc
                        (cdr list)))))

(exit)