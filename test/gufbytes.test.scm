(define-module (gufbytes.test)
  #:use-module (srfi srfi-64)
  #:use-module (guf gufbytes))

(test-begin "gufbytes")

(test-equal "bytes-to-human returns 1024 as 1KB"
            (bytes-to-human 1024) "1KB")

(test-equal "bytes-to-human returns 1048576 as 1MB"
            (bytes-to-human 1048576) "1MB")

(test-equal "bytes-to-human returns 1073741824 as 1GB"
            (bytes-to-human 1073741824) "1GB")

(test-end)
