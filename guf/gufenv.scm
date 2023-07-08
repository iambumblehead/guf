(define-module (gum gumenv)
  #:export (gumenv-nameuserget
            gumenv-namehostget
            gumenv-namecwdget))

;; user, hostname and cwd
(define (gumenv-nameuserget)
  (getenv "USER"))

(define (gumenv-namehostget)
  (vector-ref (uname) 1))

(define (gumenv-namecwdget)
  (dirname (current-filename)))
