(define-module (guf gufsort)
  #:use-module (ice-9 regex)
  #:export (gufsortlist))

(define (asalphanum str)
  (regexp-substitute/global #f "[^[:alnum:]]" str 'pre "" 'post))

(define (sortalphanum left right)
  (string<? (asalphanum left) (asalphanum right)))
  
(define (gufsortlist items)
  (sort items sortalphanum))
