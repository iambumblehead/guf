(define-module (gum gumsort)
  #:use-module (ice-9 regex)
  #:export (gumsortlist))

(define (asalphanum str)
  (regexp-substitute/global #f "[^[:alnum:]]" str 'pre "" 'post))

(define (sortalphanum left right)
  (string<? (asalphanum left) (asalphanum right)))
  
(define (gumsortlist items)
  (sort items sortalphanum))
