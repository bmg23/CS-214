;; switch.clj
;; Author: Brian Goins (bmg23)
;; Date: 2/16/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns switch)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Function letterGrade
;;Input: average grade, Integer
;;Output: letter grade, string
;;Uses case statement to return letter grade.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn letterGrade [average]
    (cond
        (= (int (/ average 10)) 10)           "A"
        (= (int (/ average 10)) 9)             "A"
        (= (int (/ average 10)) 8)             "B"
        (= (int (/ average 10)) 7)             "C"
        (= (int (/ average 10)) 6)             "D"
        :else                                  "F"      
    )
)

(defn -main []
    (print "\nEnter the average grade: ")
    (flush)
    (let
        [ avgGrade (read) ]

        (print "\nLetter Grade: ")
        (print (letterGrade avgGrade))
        (print "\n") (flush)
    
    )
)