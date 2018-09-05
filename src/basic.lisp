(defun higher-level-expt
  (m n)
  (if (zerop n)
      1
      (* m (higher-level-expt m (- n 1)))))

(defun count-elements
  (l)
  (if (endp l)
      0
      (+ 1 (count-elements (rest l)))))

(defun count-elements-aux
  (l result)
  (if (endp l)
      result
      (count-elements-aux (rest l) (+ 1 result))))

(defun skip-first-n
  (n l)
  (skip-first-n-aux n l 0))

(defun skip-first-n-aux
  (n l cnt)
  (if (= n cnt)
      l
      (skip-first-n-aux n (rest l) (+ cnt 1))))

(defun keep-first-n
  (n lst)
  (keep-first-n-aux n lst 0 nil))

(defun keep-first-n-aux
  (n lst cnt result)
  (if (= n cnt)
      result
      (keep-first-n-aux n (rest lst) (+ 1 cnt) (append result (list (first lst))))))