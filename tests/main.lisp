;;;; tests/main.lisp

(in-package #:mdc-utilities-tests)

(def-suite all-tests
  :description "The master suite of all mdc-utilities tests.")

(in-suite all-tests)

(defun test-mdcu ()
  (run! 'all-tests))
