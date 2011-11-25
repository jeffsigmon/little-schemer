(load "./../src/06-shadows.scm")
(load "./../lib/test-manager/load.scm")

(in-test-group     
 06-shadows
 (define-test (numbered?-tests)
   (assert-true (numbered? 2) "Number is always true")
   (assert-true (numbered? '(1 + 1)) "single infix addition is true")
   (assert-true (numbered? '(4 + (1 + 1))) "combined infix is true")
   (assert-false (numbered? 'a) "symbol fails")
   (assert-false (numbered? '(+ 2 2)) "prefix with numbers fails")
   (assert-false (numbered? '(2 + (+ 2 2))) "prefix in sexp fails"))
 (define-test (1st-sub-exp-tests)
   (assert-equal 2 (1st-sub-exp '(2 * 3)))
   (assert-equal '* (operator '(2 * 3)))
   (assert-equal 3 (2nd-sub-exp '(2 * 3))))
 (define-test (value-tests)
   (assert-equal 20 (value '(5 * 4)) "value of single exression")
   (assert-equal 20 (value '(5 * (2 + 2))) "value of nested exressions"))
 (define-test (zzero?-tests)
   (assert-true (zzero? '()) "sum of zero parens is zero")
   (assert-false (zzero? '(())) "sum of one zero is not zero")
   )
 (define-test (zadd1-tests)
   (assert-true 5 (zadd1 '(()()()())) "add to non empty list")
   (assert-true 1 (zadd1 '()) "add to empty list"))
 (define-test (zsub1-tests)
   (assert-true 1 (zsub1 '(()())) "sub from non empty list")
   ;;(assert-true -1 (zsub1 '()) "sub from empty list; won't work. don't have representation for this.")
   )
 (define-test (zplus-tests)
   (assert-true 0 (zplus '() '()) "two empty lists added is zero")
   (assert-true 2 (zplus '(()) '(())) "add two non empty lists")))

(run-registered-tests)
