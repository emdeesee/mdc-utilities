;;;; tree.lisp
;;;; Utility functions related to tree operations.
;;;; Copyright (c) 2018 Michael Cornelius <kouneriasu@gmail.com>

(in-package :mdc-utilities)



(defun tree-find-if (f tree)
  "Return non-NIL if F is true for some node
in the tree. NIL otherwise"
  (if (atom tree)
      (and tree (funcall f tree))
      (or (tree-find-if f (car tree))
          (tree-find-if f (cdr tree)))))


(defun tree-find (value tree &key (test #'eql))
  "Return T if VALUE is found as a node in TREE."
  (tree-find-if
   (lambda (node) (funcall test node value))
   tree))
