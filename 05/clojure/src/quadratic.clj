;;Quadratics.clj
;; Program: uses a subprogram to compute the roots of 
;; a quadratic equation.
;; Author: Brian Goins (bmg23)
;; Date: 03/04/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns quadratic)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;quadraticRoots
;;Input: a, b, c 3 numbers                          
;;Output: vector holding the positive and negative  
;;        roots from the quadratic equation.        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn quadraticRoots [a b c]
    (if (> a 0)
        ;;True Part
        (let [arg (- (* b b) (* 4 a c))]
            (if (> arg 0)
                ;;True Part
                (let [sqrtArg (Math/sqrt arg)
                    root1 (/ (+ (- b) sqrtArg) (* 2 a))
                    root2 (/ (- (- b) sqrtArg) (* 2 a))]
                    (vector root1 root2 1)
                )
                ;;False Part
                (
                    (print "\n*** quadraticRoots(): b^2 - 4ac is negative!") (flush)
                    (vector 0 0 0)
                )
            )
        )
        ;;False Part
        (
            (print "\n*** QuadraticRoots(): a is zero!") (flush)
            (vector 0 0 0)
        )
    )
)


(defn -main[]
    (print "\nQuadratic equation calculator (a b c): ") (flush)
    (let [  a (read)
            b (read)
            c (read)
            result (quadraticRoots a b c)
            root1 (get result 0)
            root2 (get result 1)
            torf (get result 2)
        ]

        (if (> torf 0)
            ((print "\n+x = ") (print root1)
            (print "\n-x = ") (print root2)
            (flush))
        )
    )

)