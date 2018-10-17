;;;; tree-tests.lisp
;;;; Tests for tree-related functions in utility suite.

(in-package :mdc-utilities-tests)

(def-suite tree-tests
  :in all-tests
  :description "tests for tree-related utility functions")

(in-suite tree-tests)

(test tree-find-if-tests
  :description "testing mdcu:tree-find-if"
  (is (null (mdcu:tree-find-if #'identity nil)))
  (let ((tree '(2 (4 (6 8 10) (12 14 16)) ((18 20) (22 24 (26 28 30))))))
    (is (mdcu:tree-find-if (lambda (node) (zerop (rem node 9))) tree) "Should have found 18")
    (is (mdcu:tree-find-if #'evenp tree))
    (is-false (mdcu:tree-find-if #'oddp tree) "Found odd node, but no odd nodes in test set")))

(test tree-find-tests
  :description "tests mdcu:tree-find"
  (is (null (mdcu:tree-find :some-val nil)))
  (is (mdcu:tree-find :z '(:z (:y :x (:w :v (:u :t :s))) (:r (:q :p (:o :n :m) :l)))))
  (is (mdcu:tree-find :o '(:z (:y :x (:w :v (:u :t :s))) (:r (:q :p (:o :n :m) :l)))))
  (is-false (mdcu:tree-find :a '(:z (:y :x (:w :v (:u :t :s))) (:r (:q :p (:o :n :m) :l))))))
