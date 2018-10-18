;;;; mdc-utilities.asd
;;
;;;; Copyright (c) 2018 Michael Cornelius <kouneriasu@gmail.com>


(asdf:defsystem #:mdc-utilities
  :description "My utility functions"
  :author "Michael Cornelius <kouneriasu@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "sequence")
               (:file "tree"))
  :depends-on (:alexandria)
  :in-order-to ((test-op (test-op "mdc-utilities/tests"))))


(asdf:defsystem #:mdc-utilities/tests
  :description "Tests for mdc-utilities"
  :author "Michael Cornelius <kouneriasu@gmail.com>"
  :version "0.0.1"
  :depends-on (:mdc-utilities :fiveam)
  :perform (test-op (o s)
                    (uiop:symbol-call :mdc-utilities-tests :test-mdcu))
  :components ((:module "tests"
                :serial t
                :components ((:file "package")
                             (:file "main")
                             (:file "sequence-tests")
                             (:file "tree-tests")))))
