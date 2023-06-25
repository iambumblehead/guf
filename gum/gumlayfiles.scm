(define-module (gum gumlayfiles)
  #:use-module (ncurses curses)
  #:export (gumlayfiles-apply))

(define (my-last lst)
  (if (null? (cdr lst))
      (car lst)
      (my-last (cdr lst))))

(define (gumlayfiles-list win files row)
  (when (not (null? (cdr files)))
    (addstr win (format #f "~a" (car files))
            #:y row #:x 0)
    (gumlayfiles-list win (cdr files) (+ row 1))))

(define (gumlayfiles-apply win files)
  (erase win)
  (gumlayfiles-list win files 0))
