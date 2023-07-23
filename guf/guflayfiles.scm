(define-module (guf guflayfiles)
  #:export (guflayfiles-apply)
  #:use-module (ncurses curses)
  #:use-module (guf guffile)
  #:use-module (guf gufbytes))

(define (guflayfile win file row)
  (if (eq? (guffile-getfiletype file) 'directory)
      (attr-on! win (logior A_BOLD (color-pair 0)))
      (attr-on! win (logior A_NORMAL (color-pair 0))))
  (addstr win (format #f "~a ~a"
                      (bytes-to-human
                       (guffile-getsizebytes file))
                      (guffile-getfilename file))
          #:y row #:x 0)
  (standend! win))

;; color pair 0 is reserved for the default foreground and background colors.
(define (guflayfiles-list win files row)
  (unless (null? (cdr files))
    (guflayfile win (car files) row)
    (guflayfiles-list win (cdr files) (+ row 1))))

(define (guflayfiles-apply win files)
  (erase win)
  (guflayfiles-list win files 1))
