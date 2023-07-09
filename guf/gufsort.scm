(define-module (guf gufsort)
  #:use-module (ice-9 regex)
  #:use-module (guf guffile)
  #:export (gufsortlist
            gufsortfilelist))

(define (asalphanum str)
  (regexp-substitute/global #f "[^[:alnum:]]" str 'pre "" 'post))

(define (sortalphanum left right)
  (string<? (asalphanum left) (asalphanum right)))
  
(define (gufsortlist items)
  (sort items sortalphanum))

(define (sortfilealphanum left right)
  (sortalphanum (guffile-getfilename left)
                (guffile-getfilename right)))

(define (gufsortfilelist items)
  (sort items sortfilealphanum))
