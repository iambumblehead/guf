(define-module (gufsys.test)
  #:use-module (srfi srfi-64)
  #:use-module (guf gufsys))

(test-begin "gufsys")

(test-assert "gufsys-terminal-string-width English"
  (= (gufsys-terminal-string-width "hello") 5))

(test-assert "gufsys-terminal-string-width Japanese"
  (= (gufsys-terminal-string-width "今日は") 6))

(test-end)
