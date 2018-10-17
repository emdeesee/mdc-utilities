(in-package :mdc-utilities-tests)

(def-suite sequence-tests
  :in all-tests
  :description "tests of sequence utility functions")

(in-suite sequence-tests)

(test subseq*-tests
  :description "testing mdc-utilitites:subseq*"
  (is (null (mdcu:subseq* nil 0)))
  (is (null (mdcu:subseq* nil 0 0)))
  (is (null (mdcu:subseq* nil 0 42)))
  (is (null (mdcu:subseq* nil 1 42)))
  (is (null (mdcu:subseq* nil 0 -42)))
  (let ((list (list 1 2 3 4 5)))
    (is (equal (mdcu:subseq* list 0) list))
    (is (equal (mdcu:subseq* list 0 (length list)) list))
    (is (equal (mdcu:subseq* list 1) (cdr list)))
    (is (equal (mdcu:subseq* list 2 3) '(3)))
    (is (null (mdcu:subseq* list 3 2)))
    (is (null (mdcu:subseq* list (+ 42 (length list)))))
    (is (equal (mdcu:subseq* list 0 (1- (length list))) (butlast list)))
    (is (equal (mdcu:subseq* list 1 (1- (length list))) (cdr (butlast list))))))

(test partition-tests
  :description "testing mdc-utilities:partition"
  (is (equal (list nil) (mdcu:partition 1 nil)))
  (is (equal (list nil) (mdcu:partition 1000 nil)))
  (let ((list '(1 2 3 4 5)))
    (is (equal (mdcu:partition 1 list) '((1) (2) (3) (4) (5))))
    (is (equal (mdcu:partition 2 list) '((1 2) (3 4) (5))))
    (is (equal (mdcu:partition 3 list) '((1 2 3) (4 5))))
    (is (equal (mdcu:partition 4 list) '((1 2 3 4) (5))))
    (is (equal (mdcu:partition (length list) list) (list list)))))

(test partition-by-tests
  :description "testing mdc-utilities:partition-by"
  (is (equal (mdcu:partition-by (constantly nil) nil) (list nil nil)))
  (is (equal (mdcu:partition-by (constantly t) nil) (list nil nil)))
  (let ((list '(2 6 8 5 10 12 3 8)))
    (is (equal (mdcu:partition-by #'oddp list) '((5 3) (2 6 8 10 12 8))))
    (is (equal (mdcu:partition-by #'evenp list) '((2 6 8 10 12 8) (5 3))))
    (is (equal (mdcu:partition-by (lambda (x) (= 8 x)) list) '((8 8) (2 6 5 10 12 3))))
    (is (equal (mdcu:partition-by (constantly nil) list) (list nil list)))
    (is (equal (mdcu:partition-by (constantly t) list) (list list nil)))))

(test split-at-tests
  :description "testing mdc-utilities:split-at"
  (is (equal (mdcu:split-at 0 nil) (list nil nil)))
  (is (equal (mdcu:split-at 42 nil) (list nil nil)))
  (is (equal (mdcu:split-at -3 nil) (list nil nil)))
  (let ((list '(0 1 2 3 4 5 6 7)))
    (is (equal (mdcu:split-at 0 list) (list nil list)))
    (is (equal (mdcu:split-at (length list) list) (list list nil)))
    (is (equal (mdcu:split-at 1 list) (list (list 0) (cdr list))))
    (is (equal (mdcu:split-at 2 list) (list (list 0 1) (cddr list))))
    (is (equal (mdcu:split-at 4 list) (list (list 0 1 2 3) (nthcdr 4 list))))
    (is (equal (mdcu:split-at 6 list) (list (list 0 1 2 3 4 5) (nthcdr 6 list))))))

(test take-tests
  :description "testing mdc-utilities:take"
  (is (null (mdcu:take 0 nil)))
  (is (null (mdcu:take 42 nil)))
  (let ((list '(0 1 2 3 4 5 6 7)))
    (is (null (mdcu:take 0 list)))
    (is (equal (mdcu:take (length list) list) list))
    (is (equal (mdcu:take 1 list) '(0)))
    (is (equal (mdcu:take 3 list) '(0 1 2)))
    (is (equal (mdcu:take 5 list) '(0 1 2 3 4)))))

(test drop-tests
  :description "testing mdc-utilities:drop"
  (is (null (mdcu:drop 0 nil)))
  (is (null (mdcu:drop 42 nil)))
  (let ((list '(0 1 2 3 4 5 6 7)))
    (is (equal (mdcu:drop 0 list) list))
    (is (null (mdcu:drop (length list) list)))
    (is (equal (mdcu:drop 1 list) (cdr list)))
    (is (equal (mdcu:drop 3 list) (nthcdr 3 list)))
    (is (equal (mdcu:drop 5 list) (nthcdr 5 list)))))

(test singlep-tests
  :description "testing mdc-utilities:singlep"
  (is (null (mdcu:singlep nil)))
  (is (mdcu:singlep '(1)))
  (is-false (mdcu:singlep '(1 2))))

(test make-circular-tests
  :description "testing mdc-utilities:make-circular"
  (signals type-error (mdcu:make-circular nil))
  (let* ((list '(a b c d e f))
         (circular (mdcu:make-circular (copy-list list))))
    (is
     (and
      (loop for x in (append list list) do (unless (equal x (pop circular)) (return nil))
            finally (return t))) "Circular list does not repeat")
    (is (eq circular (nthcdr (length list) circular)) "Cons cell is not repeated")))

(test aval-tests
  :description "testing mdc-utilities:aval"
  (is (null (mdcu:aval :foo nil)))
  (is (null (mdcu:aval :foo '((:bar . 42)))))
  (is (equal (mdcu:aval :foo '((:bar . 42) (:foo . needle))) 'needle)))
