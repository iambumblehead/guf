(define-module (guf guffile)
  #:use-module (guf guffs)
  #:export (guffile-create
            guffile-createlist
            guffile-list-fromdir
            guffile-getfilename))

(define dir-sep-str file-name-separator-string)

(define dir-sep-char (string-ref file-name-separator-string 0))

(define (guffile-join-path dir name)
  (string-append
   (string-trim-right dir (λ (char) (char=? char dir-sep-char)))
   dir-sep-str
   name))

;; filepath must be a valid input, not "." or ".."
(define (guffile-create filepath)
  (let ((filestat (stat (open-input-file filepath))))
    (list
     (cons 'filename (basename filepath))
     (cons 'filepath filepath)
     (cons 'filetype (stat:type filestat))
     (cons 'filesizebytes (stat:size filestat)))))

(define (guffile-getfilename file)
  (assoc-ref file 'filename))

(define* (guffile-list-fromdir #:optional (dir (guffs-cwd)))
  (map (lambda (file) (guffile-create (guffile-join-path dir file)))
       (guffs-readdir dir)))
