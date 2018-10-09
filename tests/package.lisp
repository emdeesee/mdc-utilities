;;;; tests/package.lisp

(defpackage #:mdc-utilities-tests
  (:use #:cl #:fiveam)
  (:export #:test-mdcu
           #:run!
           #:all-tests))
