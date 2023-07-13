(define-module (guf guffile)
  #:use-module (guf guffs)
  #:use-module (ice-9 regex)
  #:export (guffile-create
            guffile-createlist
            guffile-list-fromdir
            guffile-getfilenamealnum
            guffile-getfilename
            guffile-getfiletype))

(define dir-sep-str file-name-separator-string)

(define dir-sep-char (string-ref file-name-separator-string 0))

(define guffile-not-alnum-re (make-regexp "[^[:alnum:]]"))

(define (asalnum str)
  (regexp-substitute/global #f guffile-not-alnum-re str 'pre "" 'post))

(define (guffile-join-path dir name)
  (string-append
   (string-trim-right dir (λ (char) (char=? char dir-sep-char)))
   dir-sep-str
   name))

;; filepath must be a valid input, not "." or ".."
(define (guffile-create filepath)
  (let ((filestat (stat filepath)))
    (list
     (cons 'filenamealnum (asalnum (basename filepath)))
     (cons 'filename (basename filepath))
     (cons 'filepath filepath)
     (cons 'filetype (stat:type filestat))
     (cons 'filesizebytes (stat:size filestat)))))

(define (guffile-getfilename file)
  (assoc-ref file 'filename))

(define (guffile-getfilenamealnum file)
  (assoc-ref file 'filenamealnum))

(define (guffile-getfiletype file)
  (assoc-ref file 'filetype))

(define* (guffile-list-fromdir #:optional (dir (guffs-cwd)))
  (map (lambda (file) (guffile-create (guffile-join-path dir file)))
       (guffs-readdir dir)))
