(define (DERIV EXP VAR)
  (cond ((CONSTANT? EXP VAR) 0)
        ((SAME-VAR? EXP VAR) 1)
        ((SUM? EXP)
          (MAKE-SUM (DERIV (A1 EXP) VAR)
                    (DERIV (A2 EXP) VAR)))
        ((PRODUCT? EXP)
          (MAKE-SUM
            (MAKE-PRODUCT (M1 EXP)
                          (DERIV (M2 EXP) VAR))
            (MAKE-PRODUCT (DERIV (M1 EXP) VAR)
                          (M2 EXP))))
    ))


(define (CONSTANT? EXP VAR)
  (and (ATOM? EXP)
       (NOT (EQ? EXP VAR))))

(define (SAME-VAR? EXP VAR)
  (and (ATOM? EXP)
       (EQ? EXP VAR)))


(define (SUM? EXP)
  (and (NOT (ATOM? EXP))
       (EQ? (CAR EXP) '+)))

(define (MAKE-SUM a1 a2)
  (LIST '+ a1 a2))

(define (PRODUCT? EXP)
  (and (NOT (ATOM? EXP))
       (EQ? (CAR EXP) '*)))


(define (MAKE-SUM A1 A2)
  (cond ((and (NUMBER? A1)
              (NUMBER? A2))
         (+ A1 A2))
        ((and (NUMBER? A1) (= A1 0))
          A2)
        ((and (NUMBER? A2) (= A2 0))
          A1)
        (ELSE (LIST '+ A1 A2))))
