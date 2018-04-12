(setq mylist '(a b c d))	; this creates a list for use

(defun mylast (l)			; defines a new funciton mylast to return the las item in the argument
	(cond
		( (null l) nil)
		((null (cdr l)) (car l))
		(t (mylast (cdr l)))
	)
)

(defun removelast (l)
	(cond
		( 	(null l) nil)
		(	(null (cdr l)) '())
		(t (cons (car l)(removelast (cdr l))))
	)
)

(defun mycount (l)
	(cond
		( (null l) 0)
		(t (+ 1 (mycount (cdr l))))
	)
)

(defun mycat (l1 l2)
	(cond
		( (null l1) l2)
		( (null l2) l1)
		
		(t (cons (car l1)(mycat (cdr l1) l2)))
	)
)

(defun mypair (first second)
	(cond
		((and (null first) (null second)) nil)
		(t (cons (list(car first)(car second))(mypair (cdr first)(cdr second))))
	)
)
(defun mysubs (toBeReplaced toReplace list)
	(cond
		((null list) nil)
		(t (cond
				((eq toBeReplaced (car list)) (cons toReplace (mysubs toBeReplaced toReplace cdr (list))))
				(t (cons (car list) (mysubs toBeReplaced toReplace (cdr list))))
			)
		)
	)
)
; (eq a b)
(defun getht (tree)
	(cond 
		((null tree) 0)
		(t (+ 1 (mymax (getht(cadr tree)) (getht(caddr tree))) ))
	)
)
(defun mymax (a b)
	(cond
		(( > a b) a )
		(t b)
	)
)
;(setq tree '(a (b (c) ()) (d (e () (f)))))
(setq tree '(3 (2 (1) ()) (5 (4) (6) )))
(defun inorder (tree)
	(cond
		((null tree) nil)
		(t (mycat (inorder (cadr tree)) (cons (car tree) (inorder (caddr tree)))))
	)
)

(defun smallestInTree (tree)
	(cond
		( (null (cadr tree)) (car tree) )
		(t (smallestInTree (cadr tree) ))
	)
)



(defun testbst (tree)
	(bst (inorder tree))
)

(defun bst (tree)
	(cond 
		((null tree) nil)
		((null (cdr tree)) t)
		(t 
			(cond 
				((< (car tree) (cadr tree)) (bst (cdr tree)))
				(t nil)
			)
		)
	)
)


;( t (> (caar tree) (caadr tree) ) (cadr tree))
;(> (car tree) (caadr tree)) (< (car tree) (caaddr tree)) ))
;( (null (car tree)) t)
;		(t (and (bst (cadr tree)) (bst (caddr tree)) 
;			(cond (null(cadr tree))
;				(f (> (car tree) (caadr tree)))
;			)
;			(cond (null(caddr tree))
;				(f (< (car tree) (caaddr tree)))
;			)
;			)
;		)