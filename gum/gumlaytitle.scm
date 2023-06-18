(define-module (gum gumlaytitle)
  #:export (gumlaytitle-apply)
  #:use-module (gum gumenv)
  #:use-module (ncurses curses))

(define (gumlaytitle-apply win)
  (addstr win
          (format #f "Layout is ~a ~%" (gumenv-namehostget))))
