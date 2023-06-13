#!/usr/bin/guile
!#

(load "src/gumlay.scm")
(load "src/gumwin.scm")
(load "src/gum.scm")

;; interesting import syntax using prefix
;; https://stackoverflow.com/questions/56918962/should-i-define-separate-module-for-every-file-in-my-guile-project
(import (prefix (gum gum)))
        
