;	Anthony Sharp
;	AVSRCM
;	PLT Hw04 Lisp
;	November 19, 2019

(defun myLast (L)
	(if (not L) nil 
	(if (not (cdr L)) (car L) (myLast (cdr L)))))

(defun myCount (X L) 
    (cond ((null L) 0) 
    ((eq X (car L)) 
    (+ 1 (myCount X (cdr L)))) 
    (+ (myCount X (cdr L)))))
 
(defun myMember (X L) 
    (cond ((null X) nil) 
    ((null L) nil) 
    (t (if (eq X (car L)) t (myMember X (cdr L))))))

(defun myPurge (L)
  (cond
   ((null L) L)
   ((myMember (car L) (cdr L)) (myPurge (cdr L)))
   (t (cons (car L) (myPurge (cdr L))))))
   
(defun myCommon (L1 L2)
    (if (eq (cdr L1) nil) 
    (if (myMember (car L1) L2) (car L1) nil) 
    (if (myMember (car L1) L2) (cons (car L1)
    (myCommon (cdr L1) L2) (myCommon (cdr L1) L2)))))

(defun myGen (X Y) (if (< Y X) nil (cons X (myGen (+ X 1) Y))))

(defun myMap (F L) 
    (if L (cons (funcall F (car L)) (myMap F (cdr L))) nil))

(defun myReduce (F L) (cond (( null L) nil) ((null (cdr L)) (car L)) 
    (t (funcall F (car L) (myReduce F (cdr L))))))
