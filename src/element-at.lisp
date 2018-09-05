;; L-99: Ninety-Nine Lisp Problems
;; P3: Find the K'th element of a list.
;; The first element in the list is number 1.
;; Example:
;; * (element-at '(a b c d e) 3)
;; C

(defpackage :kcjpop (:use :cl :1am))
(in-package :kcjpop)

(defun element-at-aux
  (lst pos index)
  (if (null lst)
      nil
      (if (= pos index)
        (first lst)
        (element-at-aux (rest lst) pos (+ index 1)))))

(defun element-at
  (lst pos)
  (element-at-aux lst pos 0))

;; Tests

(test element-at-tests
  (is (equal (element-at nil 3) nil))
  (is (equal (element-at '(a) 0) 'a))
  (is (equal (element-at '(a b c) 2) 'c))
  (is (equal (element-at '(a b c) 5) nil)))