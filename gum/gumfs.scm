(define-module (gum gumfs)
  #:use-module (ice-9 ftw)
  #:export (gumfs-readdir))

(define (gumfs-cwd)
  (getcwd))

(define* (gumfs-readdir #:optional (dir (gumfs-cwd)))
  (scandir dir))
