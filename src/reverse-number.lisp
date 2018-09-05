(defpackage :kcjpop (:use :cl :1am))
(in-package :kcjpop)

(defun number-to-list-aux
  (n result)
  (let* ((d (floor (/ n 10)))
         (r (- n (* d 10)))
         (res (append (list r) result)))
    (if (zerop d)
      res
      (number-to-list-aux d res))))

(defun number-to-list
  (n)
  (number-to-list-aux n nil))

(defun list-to-reverse-number
  (lst)
  (let ((result 0)
        (power 1))
    (dolist (el lst result)
        (setf result (+ result (* el power))
              power (* power 10)))))

(defun reverse-number
  (n)
  (let* ((negative (minusp n))
        (sign (if negative -1 1))
        (absn (abs n))
        (res (list-to-reverse-number (number-to-list absn))))
    (* sign res)))

;; Tests

(test reverse-number-tests
  (is (= (reverse-number -19) -91))
  (is (= (reverse-number -1) -1))
  (is (= (reverse-number 0) 0))
  (is (= (reverse-number 1) 1))
  (is (= (reverse-number 19) 91))
  (is (= (reverse-number 284) 482))
  (is (= (reverse-number 1234) 4321))
  (is (= (reverse-number -1234) -4321)))
