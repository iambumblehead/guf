(define-module (guf guffile)
  #:export (guffile-create
            guffile-createlist
            guffile-getfilename))

(define (guffile-create file)
  (list
   (cons 'filename file)
   (cons 'filesize 23)))

(define (guffile-getfilename file)
  (assoc-ref file 'filename))

(define (guffile-createlist files)
  (map guffile-create files))
