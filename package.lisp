;;;; package.lisp
;;
;;;; Copyright (c) 2018 Michael Cornelius <kouneriasu@gmail.com>


(defpackage #:mdc-utilities
  (:nicknames #:mdcu #:mdc-util)
  (:use #:cl #:alexandria)
  (:export #:partition
           #:split-at
           #:take
           #:drop
           #:subseq*))
