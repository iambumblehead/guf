(define-module (gum gum)
  #:use-module (gum gumwin)
  #:use-module (gum gumlay)
  #:use-module (gum gumlaytitle)
  #:use-module (gum gumlayfiles)
  #:use-module (gum gumch)
  #:use-module (gum gumfs)
  #:use-module (ncurses curses))

;; Program Begins
(define stdscr (initscr)) ; Start curses
(define layoutstart (gumlayget (getmaxyx stdscr)))
(cbreak!)                 ; Line buffering disabled
(keypad! stdscr #t)       ; Check for function keys
(start-color!)
(refresh stdscr)

(let loop ((layout layoutstart)
           (layoutwins (gumwinlistcreate layoutstart))
           (ch #f))

  (gumlaytitle-apply (car layoutwins))
  (gumlayfiles-apply (caddr layoutwins) (gumfs-readdir))
  (refresh (car layoutwins))
  (refresh (caddr layoutwins))
  ;;(addstr stdscr (format #f "list is ~a ~%" (gumfs-readdir)))

  (cond
   ((gumch-isQUIT? ch) #f)
   ((gumch-isRESIZE? ch)
    (refresh stdscr)
    (let ((layoutnew (gumlayget (getmaxyx stdscr))))
      (gumwinlistrm layoutwins)
      (loop layoutnew
            (gumwinlistcreate layoutnew)
            #f)))
   (else
    (loop layout
          layoutwins
          (getch stdscr)))))

(endwin)
