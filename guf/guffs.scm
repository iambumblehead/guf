(define-module (guf guffs)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 regex)
  #:export (guffs-readdir
            guffs-cwd))

(define (guffs-cwd)
  (getcwd))

(define (isdotstr? str)
  (string-match "^\\.\\.?$" str))

(define* (guffs-readdir #:optional (dir (guffs-cwd)))
  (filter (lambda (item) (not (isdotstr? item))) (scandir dir)))
