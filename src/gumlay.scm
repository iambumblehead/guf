 ;; #:use-module (ncurses curses)
(define-module (gum gumlay)
  #:export (gumlayget))

(define (gumlaymillerget cols height y)
  (let ((colx (inexact->exact (round (* cols 0.125))))
        (coly (inexact->exact (round (* cols 0.5))))
        (colz cols))
    (list (list height colx y 0)
          (list height (- coly colx) y (+ colx 0))
          (list height (- colz coly) y (+ coly 0)))))

(define (gumlayget maxxy)
  (let* ((rows (car maxxy))
         (cols (cadr maxxy))
         (colsmiller (gumlaymillerget cols (- rows 1) 1)))
    ;; (addstr stdscr
    ;;         (format #f "cols miller columns: ~a ~%"
    ;;                 (layoutmillerget cols (- rows 1) 1)))
    ;;
    ;; follows window format height, width, y, x
    (list (list 1 cols 0 0)
          (car colsmiller)
          (cadr colsmiller)
          (caddr colsmiller))))
