(use-modules (ncurses curses))

(define stdscr (initscr))

;; https://www.gnu.org/software/guile-ncurses/manual/guile-ncurses.html
(define showme (lambda ()
                 (let* ((mesg "Just a string")
                        (len (string-length mesg))
                        (siz (getmaxyx stdscr))
                        (row (car siz))
                        (col (cadr siz)))

                   (move stdscr
                         (round (/ row 2))
                         (round (/ (- col len) 2)))

                   (addstr stdscr mesg)
                   ;; Use "format" to generate a message, and then print it
                   (addstr stdscr
                           (format #f "This screen has ~a rows and ~a columns ~%"
                                   row col)
                           #:y (- row 2)
                           #:x 0))))

(showme)
(refresh stdscr)
(getch stdscr)
(endwin)
