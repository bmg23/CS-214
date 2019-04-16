;; factorial.clj, takes an integer n and returns n!
;;
;; Author: Brian Goins
;; Date 2/26/2019 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns factorial)

(defn factorial [n]
    (if (< n 2)
        1
        (* n (factorial (- n 1)))
    )
    
)

(defn -main[]
    (print "Enter a number to get its factorial: ")
    (flush)

    (let
        [n (double (read))] 
        (printf "\nFactorial = %f" (factorial n))
        
    )
    (print "\n\n") (flush)
)

