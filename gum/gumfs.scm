(define-module (gum gumfs)
  #:use-module (ice-9 ftw)
  #:export (gumfs-readdir))

(define (gumfs-cwd)
  (dirname (current-filename)))

(define* (gumfs-readdir #:optional (dir (gumfs-cwd)))
  (scandir dir))
