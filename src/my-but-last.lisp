;; L-99: Ninety-Nine Lisp Problems
;; P2: Find the last but one box of a list.
;; Example:
;; * (my-but-last '(a b c d))
;; (C D)

(defpackage :kcjpop (:use :cl :1am))
(in-package :kcjpop)

(defun my-but-last
  (lst)
  (if (null lst)
      nil
      (if (<= (length lst) 2)
          lst
          (my-but-last (rest lst)))))

;; Tests

(test my-but-last-tests
  (is (equal (my-but-last nil) nil))
  (is (equal (my-but-last '(a)) '(a)))
  (is (equal (my-but-last '(a b c d)) '(c d)))
  (is (equal (my-but-last '(a b c)) '(b c))))