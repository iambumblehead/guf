(define-module (guf gufch)
  #:use-module (ncurses curses)
  #:export (gufch-isRESIZE?
            gufch-isQUIT?))

(define (gufch-isRESIZE? ch)
  (eqv? ch KEY_RESIZE))

(define (gufch-isQUIT? ch)
  (or (eqv? ch (key-f 1))
      (eqv? ch #\esc)
      (eqv? ch #\q)))
