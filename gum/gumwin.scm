(define-module (gum gumwin)
  #:use-module (ncurses curses)
  #:export (gumwincreate
            gumwinlistcreate
            gumwinrm
            gumwinlistrm
            gumwinmv))

;; makes a new window, draws a box around it
(define (gumwincreate height width starty startx)
  ((lambda (win)
     (if (< 1 height) ;; no border if only 1 tall
         (box win (acs-vline) (acs-hline)))
     (refresh win)
     win)
   (newwin height width starty startx)))

(define (gumwinlistcreate laylist)
  (map (lambda (args)
         (apply gumwincreate args)) laylist))

;; erases box around window then deletes it
(define (gumwinrm win)
  (let ((s (normal #\sp)))
    (border win s s s s s s s s) ; Draw a box of spaces
    (refresh win)
    (delwin win)))

(define (gumwinlistrm winlist)
  (map gumwinrm winlist))

;; deletes a window then draw a new one someplace
(define (gumwinmv win height width starty startx)
  (gumwinrm win)
  (gumwincreate height width starty startx))
