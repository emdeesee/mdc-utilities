;;; file-tests.lisp
;;; Tests for file-related utility functions

(in-package :mdc-utilities-tests)

(def-suite file-tests
  :in all-tests
  :description "tests for file-related utility functions")

(in-suite file-tests)

(test file-get-contents-tests
  :description "testing mdc-utilities:file-get-contents"
  (let ((contents "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a leo egestas, dapibus sapien eu, lobortis nibh. Sed viverra enim lacus, sed imperdiet libero auctor eu. Quisque orci lectus, ornare id quam ac, auctor tincidunt est. Ut neque risus, cursus sed auctor quis, gravida quis urna. Mauris nulla dolor, convallis et felis et, viverra ullamcorper felis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus malesuada ipsum nec felis mollis venenatis."))
    (uiop/stream:with-temporary-file (:pathname p :stream s :direction :io)
      (format s "~a~%" contents)
      :close-stream
      (string= (mdcu:file-get-contents p) contents))))
