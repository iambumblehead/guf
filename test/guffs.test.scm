(define-module (guffs.test)
  #:use-module (srfi srfi-64)
  #:use-module (guf guffs))

(test-begin "guffs")

(test-equal "(guffs-isnotdotstr? 'test'), #t"
            (guffs-isnotdotstr? "test") #t)

(test-equal "(guffs-isnotdotstr? '.test'), #t"
            (guffs-isnotdotstr? ".test") #t)

(test-equal "(guffs-isnotdotstr? '..'), #f"
            (guffs-isnotdotstr? "..") #f)

(test-equal "(guffs-isnotdotstr? '.'), #f"
            (guffs-isnotdotstr? ".") #f)

(test-end)
