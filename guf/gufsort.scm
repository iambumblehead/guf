(define-module (guf gufsort)
  #:use-module (guf guffile)
  #:export (gufsortlist
            gufsortfilelist))

(define (gufsort-filenamealnum left right)
  (string<? (guffile-getfilenamealnum left)
            (guffile-getfilenamealnum right)))

(define (gufsort-filetypes-same? left right)
  (eq? (guffile-getfiletype left)
       (guffile-getfiletype right)))

(define (gufsort-filetypes left right)
  (if (eq? (guffile-getfiletype left) 'directory) #t #f))

(define (sortdirfilealphanum left right)
  (if (gufsort-filetypes-same? left right)
      (gufsort-filenamealnum left right)
      (gufsort-filetypes left right)))

(define (gufsortfilelist items)
  (sort items sortdirfilealphanum))
