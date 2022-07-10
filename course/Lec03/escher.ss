(load "../Lec02/cons.ss")
;(load "../Lec02/list.ss")

(define (coord-map rect)
  ((lambda (point)
     (+vect
      (+vect (scale (xcor point)
                    (horiz rect))
             (scale (ycor point)
                    (vert rect)))
      (origin rect)))))

(define (make-picture seglist)
  (lambda (rect)
    (for-each
     (lambda (s)
       (drawline
        ((coord-map rect) (seg-start s))
        ((coord-map rect) (seg-end s))))
     seglist)))
  



















(exit)