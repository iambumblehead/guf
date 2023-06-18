(define-module (gum gum)
  #:use-module (gum gumwin)
  #:use-module (gum gumlay)
  #:use-module (gum gumlaytitle)
  #:use-module (ncurses curses))

;; Program Begins
(define stdscr (initscr)) ; Start curses
(define layoutstart (gumlayget (getmaxyx stdscr)))
(cbreak!)                 ; Line buffering disabled
(keypad! stdscr #t)       ; Check for function keys
(refresh stdscr)

(let loop ((layout layoutstart)
           (layoutwins (gumwinlistcreate layoutstart))
           (ch (getch stdscr)))

  ;; (gumlaytitle-apply stdscr)
  (refresh (caddr layoutwins))
  (gumlaytitle-apply (caddr layoutwins))

  (cond
   ((eqv? ch KEY_RESIZE)
    (refresh stdscr)
    (let ((layoutnew (gumlayget (getmaxyx stdscr))))

      ;;(addstr stdscr
      ;;         (format #f "Layout is ~a ~%" layout))
      (gumwinlistrm layoutwins)
      (loop layoutnew
            (gumwinlistcreate layoutnew)
            (getch stdscr))))

   ((or (eqv? ch (key-f 1))
        (eqv? ch #\esc)
        (eqv? ch #\q))
    #f)

   (else
    (loop layout
          layoutwins
          (getch stdscr)))))

(endwin)
