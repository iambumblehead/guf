(define-module (gum gumlay)
  #:export (gumlayget
            gumlaymillerget))

(define (gumlaymillerget cols height y)
  (let ((colx (inexact->exact (round (* cols 0.125))))
        (coly (inexact->exact (round (* cols 0.5))))
        (colz cols))
    (list (list height colx y 0)
          (list height (- coly colx) y (+ colx 0))
          (list height (- colz coly) y (+ coly 0)))))

;; (list (list height width y x)
;;       (list height width y x)
;;       (list height width y x))
(define (gumlayget maxxy)
  (let* ((rows (car maxxy))
         (cols (cadr maxxy))
         (colsmiller (gumlaymillerget cols (- rows 2) 1)))
    ;; (addstr stdscr
    ;;         (format #f "cols miller columns: ~a ~%"
    ;;                 (layoutmillerget cols (- rows 1) 1)))
    ;;
    (list (list 1 cols 0 0)
          (car colsmiller)
          (cadr colsmiller)
          (caddr colsmiller)
          (list 1 cols (- rows 1) 0))))
