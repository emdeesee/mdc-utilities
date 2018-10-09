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
               (:file "file"))
  :depends-on (:alexandria))
