;;;; file.lisp
;;;; Utility functions related to file operations.
;;;; Copyright (c) 2018 Michael Cornelius <kouneriasu@gmail.com>

(in-package :mdc-utilities)

(defun file-get-contents (filename)
  (with-open-file (s filename)
    (let ((contents (make-string (file-length s))))
      (read-sequence contents s)
      contents)))
