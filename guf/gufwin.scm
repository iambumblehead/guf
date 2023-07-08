(define-module (guf gufwin)
  #:use-module (ncurses curses)
  #:export (gufwincreate
            gufwinlistcreate
            gufwinrm
            gufwinlistrm
            gufwinmv))

;; makes a new window, draws a box around it
(define (gufwincreate height width starty startx)
  ((lambda (win)
     (if (< 1 height) ;; no border if only 1 tall
         (box win (acs-vline) (acs-hline)))
     (refresh win)
     win)
   (newwin height width starty startx)))

(define (gufwinlistcreate laylist)
  (map (lambda (args)
         (apply gufwincreate args)) laylist))

;; erases box around window then deletes it
(define (gufwinrm win)
  (let ((s (normal #\sp)))
    (border win s s s s s s s s) ; Draw a box of spaces
    (refresh win)
    (delwin win)))

(define (gufwinlistrm winlist)
  (map gufwinrm winlist))

;; deletes a window then draw a new one someplace
(define (gufwinmv win height width starty startx)
  (gufwinrm win)
  (gufwincreate height width starty startx))
