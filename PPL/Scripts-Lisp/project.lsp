
(defun checkBoolean (val truthSet)
	(cond
		((null truthSet) nil)
		(t (cond
			 ((and (eq (caar truthSet) val) (eq (cadar truthSet) 't)))
			(t (checkBoolean val (cdr truthSet)))
			)
		)
	)
)

(defun evalb (expr truthSet)
	(eval (cons (car expr) (temp (cdr expr) truthSet)))
)
(defun temp (expr truthSet)
	(cond
		((null expr) nil)
		(t (cond
			((atom (car expr)) (mysubs (car expr) (checkBoolean (car expr) truthSet) (cons (car expr)(temp (cdr expr) truthSet) )))
			(t (mysubs (car expr) (checkBoolean (car expr) truthSet)(cons (evalb (car expr) truthSet)(temp (cdr expr) truthSet))))
		))
	
	)
)



(defun mysubs(that this mylist)
	(cond
		( (null mylist) nil)
		(t (cond
				( (eq that (car mylist))(cons this (mysubs that this (cdr mylist))) )
				( t (cons (car mylist) (mysubs that this (cdr mylist))))
			)              
		)
	)
)
