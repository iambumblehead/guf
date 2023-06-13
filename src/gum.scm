#!/usr/bin/guile
!#

(load "gumlay.scm")
(load "gumwin.scm")

(define-module (gum gum)
  #:version (0 0 1)
  #:use-module (gum gumlay)
  #:use-module (gum gumwin)
  #:use-module (ice-9 match)
  #:use-module (ncurses curses))

;; Program Begins
(define stdscr (initscr)) ; Start curses
(cbreak!)                 ; Line buffering disabled
(keypad! stdscr #t)       ; Check for function keys

(addstr stdscr "Press F1 to exit")
(refresh stdscr)

(define wins (map (lambda (args)
                    (apply gumwincreate args))
                  (gumlayget (getmaxyx stdscr))))

(addstr stdscr (format #f "Layout is ~a ~%" wins))

;; build windows with applied list
(let loop ((layout (gumlayget (getmaxyx stdscr)))
           (layoutwins wins)
           (ch (getch stdscr)))
  (cond
   ((eqv? ch KEY_RESIZE)
    (let ((layoutnew (gumlayget (getmaxyx stdscr))))

      (addstr stdscr
              (format #f "Layout is ~a ~%" (getmaxyx stdscr)))
      (map gumwinrm layoutwins)
      (loop layoutnew
            (map (lambda (args)
                   (apply gumwincreate args))
                 layoutnew)
            ;;layoutwins
            (getch stdscr))))

   ((eqv? ch (key-f 1))
    #f)

   (else
    (loop layout
          layoutwins
          (getch stdscr)))))

(endwin)
