(define-module (gum gumch)
  #:use-module (ncurses curses)
  #:export (gumch-isRESIZE?
            gumch-isQUIT?))

(define (gumch-isRESIZE? ch)
  (eqv? ch KEY_RESIZE))

(define (gumch-isQUIT? ch)
  (or (eqv? ch (key-f 1))
      (eqv? ch #\esc)
      (eqv? ch #\q)))
