(define-module (gumlay.test)
  #:use-module (srfi srfi-64)
  #:use-module (gum gumlay))

(test-begin "gumlay")

(test-equal "gumlaymillerget returns miller-style window args"
            (gumlaymillerget 640 480 1)
            '((480 80 1 0) (480 240 1 80) (480 320 1 320)))

(test-end)
