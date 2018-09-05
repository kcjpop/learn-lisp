;; L-99: Ninety-Nine Lisp Problems
;; P4: Find the number of elements of a list.

(defpackage :kcjpop (:use :cl :1am))
(in-package :kcjpop)

(defun my-length-aux
  (lst counter)
  (if (null lst)
      counter
      (my-length-aux (rest lst) (1+ counter))))

(defun my-length
  (lst)
  (my-length-aux lst 0))

;; Tests

(test my-length-tests
  (is (equal (my-length nil) 0))
  (is (equal (my-length '(a)) 1))
  (is (equal (my-length '(a b)) 2))
  (is (equal (my-length '(a b c)) 3)))