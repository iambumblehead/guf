(define-module (guf guffs)
  #:use-module (ice-9 ftw)
  #:export (guffs-readdir))

(define (guffs-cwd)
  (getcwd))

(define* (guffs-readdir #:optional (dir (guffs-cwd)))
  (scandir dir))
