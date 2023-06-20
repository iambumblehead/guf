(define-module (gum gumlaytitle)
  #:export (gumlaytitle-apply)
  #:use-module (gum gumenv)
  #:use-module (ncurses curses))

(define (gumlaytitle-apply win)
  (erase win)
  (addstr win (format #f "~a@~a ~%"
                      (gumenv-nameuserget)
                      (gumenv-namehostget)))
  (addstr win (format #f "~a~%"
                      (gumenv-namecwdget))))
