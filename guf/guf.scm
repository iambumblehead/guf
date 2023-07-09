(define-module (guf guf)
  #:use-module (guf gufwin)
  #:use-module (guf guflay)
  #:use-module (guf guflaytitle)
  #:use-module (guf guflayfiles)
  #:use-module (guf gufch)
  #:use-module (guf guffs)
  #:use-module (guf gufsort)
  #:use-module (guf guffile)
  #:use-module (ncurses curses))

;; Program Begins
(define stdscr (initscr)) ; Start curses
(define layoutstart (guflayget (getmaxyx stdscr)))
(cbreak!)                 ; Line buffering disabled
(keypad! stdscr #t)       ; Check for function keys
(start-color!)
(use-default-colors)
(refresh stdscr)

(let loop ((layout layoutstart)
           (layoutwins (gufwinlistcreate layoutstart))
           (ch #f))

  (guflaytitle-apply (car layoutwins))
  (guflayfiles-apply (caddr layoutwins)
                     (guffile-createlist
                      (gufsortlist (guffs-readdir))))
  (refresh (car layoutwins))
  (refresh (caddr layoutwins))
  ;;(addstr stdscr (format #f "list is ~a ~%" (guffs-readdir)))

  (cond
   ((gufch-isQUIT? ch) #f)
   ((gufch-isRESIZE? ch)
    (refresh stdscr)
    (let ((layoutnew (guflayget (getmaxyx stdscr))))
      (gufwinlistrm layoutwins)
      (loop layoutnew
            (gufwinlistcreate layoutnew)
            #f)))
   (else
    (loop layout
          layoutwins
          (getch stdscr)))))

(endwin)
