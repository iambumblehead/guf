(define-module (guf guffs)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 regex)
  #:export (guffs-readdir
            guffs-cwd
            guffs-isnotdotstr?))

(define (guffs-cwd)
  (getcwd))

(define guffs-isdotstr-re (make-regexp "^\\.\\.?$"))

(define (guffs-isdotstr? str)
  (regexp-exec guffs-isdotstr-re str))

(define (guffs-isnotdotstr? str)
  (not (regexp-exec guffs-isdotstr-re str)))

(define* (guffs-readdir #:optional (dir (guffs-cwd)))
  (scandir dir guffs-isnotdotstr?))
