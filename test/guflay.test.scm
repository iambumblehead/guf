(define-module (guflay.test)
  #:use-module (srfi srfi-64)
  #:use-module (guf guflay))

(test-begin "guflay")

(test-equal "guflaymillerget returns miller-style window args"
            (guflaymillerget 640 480 1)
            '((480 80 1 0) (480 240 1 80) (480 320 1 320)))

(test-end)
