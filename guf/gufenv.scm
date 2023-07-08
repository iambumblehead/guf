(define-module (guf gufenv)
  #:export (gufenv-nameuserget
            gufenv-namehostget
            gufenv-namecwdget))

;; user, hostname and cwd
(define (gufenv-nameuserget)
  (getenv "USER"))

(define (gufenv-namehostget)
  (vector-ref (uname) 1))

(define (gufenv-namecwdget)
  (dirname (current-filename)))
