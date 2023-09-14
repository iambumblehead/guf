(define-module (guf gufsys)
  #:use-module (system foreign)
  #:use-module (rnrs bytevectors)
  #:export (gufsys-terminal-string-width))

;; from: https://issues.guix.gnu.org/65546n
(define get-wchar-ffi
  (pointer->procedure int
                      (dynamic-func "mbstowcs" (dynamic-link))
                      (list '* '* size_t)))
(define terminal-string-width-ffi
  (pointer->procedure int
                      (dynamic-func "wcswidth" (dynamic-link))
                      (list '* size_t)))

(define (gufsys-terminal-string-width str)
  "Return the width of a string as it would be printed on the terminal.  This
procedure accounts for characters that have a different width than 1, such as
CJK double-width characters."
  (define (get-wchar str)
    (let ((wchar (make-bytevector (* (+ (string-length str) 1) 4))))
      (get-wchar-ffi (bytevector->pointer wchar)
                     (string->pointer str)
                     (string-length str))
      wchar))
  (terminal-string-width-ffi
    (bytevector->pointer (get-wchar str))
    (string-length str)))
