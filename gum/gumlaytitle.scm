(define-module (gum gumlaytitle)
  #:export (gumlaytitle-apply)
  #:use-module (gum gumenv)
  #:use-module (ncurses curses))

(define (gumlaytitle-apply win)
  (erase win)
  ;; consult color.
  ;;(init-pair! 1 COLOR_GREEN COLOR_YELLOW)
  ;;(attr-on! win (logior A_BOLD (color-pair 1)))
  (addstr win (format #f "~a@~a ~%"
                      (gumenv-nameuserget)
                      (gumenv-namehostget)))
  (addstr win (format #f "~a~%"
                      (gumenv-namecwdget))))
