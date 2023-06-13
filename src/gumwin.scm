(define-module (gum gumwin)
  #:use-module (ncurses curses)
  #:export (gumwincreate
            gumwinrm
            gumwinmv))

;; makes a new window, draws a box around it
(define (gumwincreate height width starty startx)
  ((lambda (win)
     (box win (acs-vline) (acs-hline))
     (refresh win)
     win)
   (newwin height width starty startx)))

;; erases box around window then deletes it
(define (gumwinrm win)
  (let ((s (normal #\sp)))
    (border win s s s s s s s s) ; Draw a box of spaces
    (refresh win)
    (delwin win)))

;; deletes a window then draw a new one someplace
(define (gumwinmv win height width starty startx)
  (gumwinrm win)
  (gumwincreate height width starty startx))
