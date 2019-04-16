;; array_work.clj
;; This program displays the values of an array on the screen, 
;; and lets a user input values to fill an array.  
;; Author: Brian Goins (bmg23)
;; Date: 03/11/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns array_work)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; readArray
;; Input: size, and user input scanner. 
;; Return: Array full of user inputed values. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn readArray [size index vec]
    
    (print "\nEnter double value for index ")
    (print index)
    (print ": ")
    (flush)


    (let [input (read)]
        
        (if (> size index)
            ;;True Part
            (readArray size (+ index 1) (conj vec input))
            ;;False Part
            (conj vec input)
        )
        
    )
    
    
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; printArray, prints out the values in an array. 
;; Input: an Array
;; Output: ostream of array values
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn printArray [vector]
   (print "\nThe values of the array are: \n")
   (doseq [item vector] (println item))
  
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Main
;; Prompts user to specify size of array. 
;; Lets user input values into array. 
;; Prints the resulting array
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
    
    (print "\nEnter the size of your array: ") (flush)
    (let [  size (read)
            myVec (readArray size 1 [])
        ]    
        
         (printArray myVec)
         (print "\n")
         (flush) 
    )
   
)   

