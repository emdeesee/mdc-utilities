;;;; tests/main.lisp

(in-package #:mdc-utilities-tests)

(def-suite all-tests
  :description "The master suite of all mdc-utilities tests.")

(in-suite all-tests)

(defun test-mdcu ()
  (run! 'all-tests))

(test dummy-test
  "Just something to run to see if it works."
  (is (listp '(so long and thanks for all the fish)))
  (is (= 42 (* 6 7))))
