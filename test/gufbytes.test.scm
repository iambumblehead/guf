(define-module (gufbytes.test)
  #:use-module (srfi srfi-64)
  #:use-module (guf gufbytes))

(test-begin "gufbytes")

(test-equal "bytes-to-human returns 1024 as 1K"
            (bytes-to-human 1024) "1K")

(test-equal "bytes-to-human returns 1048576 as 1M"
            (bytes-to-human 1048576) "1M")

(test-equal "bytes-to-human returns 1073741824 as 1G"
            (bytes-to-human 1073741824) "1G")

(test-end)
