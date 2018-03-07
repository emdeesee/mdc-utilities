;;;; mdc-utilities.lisp
;;
;;;; Copyright (c) 2018 Michael Cornelius <kouneriasu@gmail.com>


(in-package #:mdc-utilities)

(defun subseq* (seq start &optional end)
  "A tolerant version of subseq. If end is out of bounds, returns start..(length seq). If start is out of bounds, returns nil."
  (let ((seq (nthcdr start seq)))
    (if end
        (loop repeat (- end start) for x in seq collect x)
        seq)))

(defun partition (n list)
  "Partition list into sublists of size n. If n does not evenly divide the length of the list, the last sublist will be of length (rem (length list) n)"
  (if (< n 1) (error (format nil "Invalid partition size, n = ~a" n)))
  (labels ((aux (source acc)
             (if-let ((rest (nthcdr n source)))
               (aux rest (cons (subseq source 0 n) acc))
               (nreverse (cons source acc)))))
    (aux list nil)))

(defun split-at (n list)
  "Return two subsequences, the first with elements 0..n-1 and the second with elements n..last"
  (labels ((aux (n source prefix)
             (if (or (null source) (zerop n))
                 (list (nreverse prefix) source)
                 (aux (1- n) (rest source) (cons (first source) prefix)))))
    (aux n list nil)))

(defun take (n list)
  "return a list of the first n elements of list"
  (loop repeat n for x in list collect x))

(defun drop (n list)
  "return a list excluding the first n elements of list"
  (nthcdr n list))

(defun singlep (list)
  "t if list is a list of one element"
  (and (consp list) (not (cdr list))))


(defun make-circular (list)
  "Turn a list into a circular list"
  (setf (cdr (last list)) list))

(defun assoc-val (item alist &rest assoc-kw-args)
  (cdr (apply #'assoc item alist assoc-kw-args)))
