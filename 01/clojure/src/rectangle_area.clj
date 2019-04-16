;;;;rectangle_area.clj calculates the area of a rectangle.
;;;;
;;;;Input: Length and width of a rectangle.
;;;;Output: The area of a rectangle. 
;;;;
;;;;Author: Brian Goins (bmg23)
;;;;Date: 02/05/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns rectangle_area) ; namespace function names the program 

(defn rectArea [itsLength, itsWidth] 
    (* itsLength itsWidth) ; return l*w
)

(defn -main [] 
   
    (def length)
    (def width)
    (println "\nTo compute the area of a rectangle,")
    (print " enter its length: ") (flush) 
    

    (let [length (read)] 
            
        (print "\n enter its width: " ) (flush)

        (let [width (read)]

        (print "\nThe area is ")
        (print (rectArea length width))
        (print "\n\n")

        )
    )

    
    
)

