;; L-99: Ninety-Nine Lisp Problems
;; P6: Find out whether a list is a palindrome.

(defpackage :kcjpop (:use :cl :1am))
(in-package :kcjpop)

(defun palindromep-aux
  (lst result)
  (cond ((null lst) result)
        ((null result) nil)
        (t (let ((first-el (first lst))
                 (last-el (first (last lst)))
                 (middle (butlast (rest lst))))
            (if (equal first-el last-el)
                (palindromep-aux middle t)
                (palindromep-aux middle nil))))))

(defun palindromep
  (lst)
  (palindromep-aux lst t))

;; LOL
(defun smart-palindromep
  (lst)
  (equal lst (reverse lst)))

;; Tests

(test palindromep-tests
  (is (equal (palindromep nil) t))
  (is (equal (palindromep '(x a m a x)) t))
  (is (equal (palindromep '(a b c c b a)) t))
  (is (equal (palindromep '(a b b c)) nil))
  (is (equal (palindromep '(a b c)) nil)))