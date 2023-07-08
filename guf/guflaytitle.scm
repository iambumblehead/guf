(define-module (guf guflaytitle)
  #:export (guflaytitle-apply)
  #:use-module (guf gufenv)
  #:use-module (ncurses curses))

(define (guflaytitle-apply win)
  (erase win)
  ;; consult color.
  ;;(init-pair! 1 COLOR_GREEN COLOR_YELLOW)
  ;;(attr-on! win (logior A_BOLD (color-pair 1)))
  (addstr win (format #f "~a@~a ~%"
                      (gufenv-nameuserget)
                      (gufenv-namehostget)))
  (addstr win (format #f "~a~%"
                      (gufenv-namecwdget))))
