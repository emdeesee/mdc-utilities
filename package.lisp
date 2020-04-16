;;;; package.lisp
;;
;;;; Copyright (c) 2018 Michael Cornelius <kouneriasu@gmail.com>


(defpackage #:mdc-utilities
  (:nicknames #:mdcu #:mdc-util)
  (:use #:cl #:alexandria)
  (:export #:randomth
           #:partition
           #:partition-by
           #:split-at
           #:take
           #:drop
           #:subseq*
           #:aval
           #:singlep
           #:tree-find-if
           #:tree-find))
