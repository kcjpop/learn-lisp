;; L-99: Ninety-Nine Lisp Problems
;; P1: Find the last box of a list.
(defpackage :kcjpop (:use :cl :1am))
(in-package :kcjpop)

(defun my-last
  (lst)
  (let* ((len (length lst))
         (index (- len 1)))
    (if (null lst)
        nil
        (nthcdr index lst))))

(defun my-other-last
  (lst)
  (if (null lst)
      nil
      (if (null (rest lst))
        lst
        (my-other-last (rest lst)))))

;; Tests

(test my-last-tests
  (is (equal (my-last nil) nil))
  (is (equal (my-last '(a)) '(a)))
  (is (equal (my-last '(a b c)) '(c))))

(test my-other-last-tests
  (is (equal (my-other-last nil) nil))
  (is (equal (my-other-last '(a)) '(a)))
  (is (equal (my-other-last '(a b c)) '(c))))