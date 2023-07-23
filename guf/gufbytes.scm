(define-module (guf gufbytes)
  #:export (bytes-to-human))

; https://en.wikipedia.org/wiki/Binary_prefix
(define units-binary
  '((1152921504606846976 "exabyte" "EB" "E") 
    (1125899906842624 "petabyte" "PB" "P") 
    (1099511627776 "terabyte" "TB" "T")
    (1073741824 "gigabyte" "GB" "G")
    (1048576 "megabyte" "MB" "M")
    (1024 "kilobyte" "KB" "K")
    (1 "byte" "B" "B")))

(define units-decimal
  '((1000000000000000000 "exabyte" "EB" "E") 
    (1000000000000000 "petabyte" "PB" "P") 
    (1000000000000 "terabyte" "TB" "T") 
    (1000000000 "gigabyte" "GB" "G")
    (1000000 "megabyte" "MB" "M")
    (1000 "kilobyte" "KB" "K")
    (1 "byte" "B" "B")))

(define (bytes-to-unit bytes unit)
  (let ((unitbytes (car unit))
        (unitlabel (cadddr unit)))
      (format #f "~vd~a" 4
              (round (/ bytes unitbytes)) unitlabel)))

(define (bytes-to-unit-best bytes units)
  (let ((unit (car units)))
    (if (< bytes (car unit))
        (bytes-to-unit-best bytes (cdr units))
        (bytes-to-unit bytes unit))))

(define* (bytes-to-human bytes #:optional (units units-binary))
  (bytes-to-unit-best bytes units))
