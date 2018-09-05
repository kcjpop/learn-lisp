;; L-99: Ninety-Nine Lisp Problems
;; P5: Reverse a list
(defpackage :kcjpop (:use :cl :1am))
(in-package :kcjpop)

(defun reverse-list-aux
  (lst result)
  (if (null lst)
      result
      (reverse-list-aux
        (rest lst)
        (cons (first lst) result))))

(defun reverse-list
  (lst)
  (reverse-list-aux lst nil))

;; Tests

(test reverse-list-tests
  (is (equal (reverse-list nil) nil))
  (is (equal (reverse-list '(a)) '(a)))
  (is (equal (reverse-list '(a b c)) '(c b a))))