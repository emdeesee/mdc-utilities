;;;; mdc-utilities.asd
;;
;;;; Copyright (c) 2018 Michael Cornelius <kouneriasu@gmail.com>


(asdf:defsystem #:mdc-utilities
  :description "Describe mdc-utilities here"
  :author "Michael Cornelius <kouneriasu@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "mdc-utilities"))
  :depends-on (:alexandria))
