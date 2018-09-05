;; L-99: Ninety-Nine Lisp Problems
;; P7: Flatten a list

(defpackage :kcjpop (:use :cl :1am))
(in-package :kcjpop)

(defun my-flatten-aux
  (lst result)
  (if (null lst)
      result
      (my-flatten-aux
        (rest lst)
        (let ((first-el (first lst)))
          (append result (if (listp first-el)
                             (my-flatten-aux first-el nil)
                             (list first-el)))))))

(defun my-flatten
  (lst)
  (my-flatten-aux lst nil))

(defun my-smarter-flatten
  (lst)
  (if (null lst)
      nil
      (let ((first-el (first lst))
            (rest-list (rest lst)))
        (append (if (listp first-el)
                    (my-smarter-flatten first-el)
                    (list first-el))
                (my-smarter-flatten rest-list)))))

;; Tests

(test my-flatten-tests
  (is (equal (my-flatten nil) nil))
  (is (equal (my-flatten '(a)) '(a)))
  (is (equal (my-flatten '(a (b (c d)))) '(a b c d)))
  (is (equal (my-flatten '(a (b (c d) e (f g)))) '(a b c d e f g))))

(test my-smarter-flatten-tests
  (is (equal (my-smarter-flatten nil) nil))
  (is (equal (my-smarter-flatten '(a)) '(a)))
  (is (equal (my-smarter-flatten '(a (b (c d)))) '(a b c d)))
  (is (equal (my-smarter-flatten '(a (b (c d) e (f g)))) '(a b c d e f g))))
          