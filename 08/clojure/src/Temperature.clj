;; Temperature.clj, this class stores a 
;; Degrees and Scale of a Temperature. 
;;  
;; Temp class: 
;;      - Stores degrees and scale
;;      - Accessors 
;;      - Conversion Functions
;;      - Relation Operations 
;; 
;; 
;; Author: Brian Goins (bmg23)
;; Date: 4/4/2019 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

;;Create a record for Temperature. 
(defrecord Temperature [degrees scale])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Check Temp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn checkTemp [degrees scale] 
    (if (and (= scale "F") (<= degrees -459.67))
        ;;True Part
        true    
        
        ;;False Part
        (if (and (= scale "C") (<= degrees -273.15))
            ;;True Part
            true    

            ;;False Part
            (if (and (= scale "F") (<= degrees -459.67))
                ;;True Part
                true    

                ;;False Part
                false
            )

        )    
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; make-Temperature constructs a Temperature object from a float and character
;; Receive: degrees (double), scale (character)
;; Return: the Temperature (degrees, scale)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn make-Temperature [degrees scale]
    (if (checkTemp degrees scale)
        (->Temperature degrees scale)
        false
    )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  GETTERS                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getDegrees [^Temperature aTemp]
  (:degrees aTemp)
)

(defn getScale [^Temperature aTemp]
  (:scale aTemp)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   SETTERS                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn setDegrees [aTemp newDegrees]
    (if (checkTemp newDegrees (:scale aTemp))
        
        ;;True Part
        (->Temperature newDegrees (:scale aTemp))

        ;;False Part
        aTemp
    )

)

(defn setScale [aTemp newScale]
    (if (checkTemp (:degrees aTemp) newScale)
        
        ;;True Part
        (->Temperature (:degrees aTemp) newScale)

        ;;False Part
        aTemp
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  CONVERTERS                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; All converters                                                             ;;
;; Receives: temperature object.                                              ;;
;; Returns: temperature object converted                                      ;;
;; to a different scale.                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 


;;To Fahrenheit
(defn toF [aTemp]
    (if (= "C" (getScale aTemp))
        ;;True Part
        (->Temperature (+ (* (:degrees aTemp) 1.8) 32) "F")

        ;;False Part
        (if (= (getScale aTemp) "K")
                ;;True Part
                (->Temperature (* (- (:degrees aTemp) 273.15) 1.8) "F")

                ;;False Part
                aTemp
        )
    )
)

;;To Celsius
(defn toC [aTemp]
    (if (= (getScale aTemp) "F")
        ;;True Part
        (->Temperature (/ (* ( - (:degrees aTemp) 32) 5) 9) "C")
        
        ;;False Part
        (if (= (getScale aTemp) "K")
            ;;True Part
            (->Temperature (- (:degrees aTemp) 273.15) "C")
        
            ;;False Part
            aTemp    
        )
    )
)

;;To Kelvin
(defn toK [aTemp]
    (if (= (:scale aTemp) "F")
        ;;True Part
        (->Temperature (+ (/ (* (- (:degrees aTemp) 32) 5) 9) 273.15) "K")

        ;;False Part
        (if (= (:scale aTemp) "C")
            ;;True Part
            (->Temperature (+ (:degrees aTemp) 273.15) "K")

            ;;False Part
            aTemp   
        )
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               I/O OPERATIONS                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn readTemp[]
    (println "\nEnter degrees and scale, hit enter after each input: ")
    (flush)
    (->Temperature (read-string (read-line)) (read-line))
    
)

(defn readStepValue []
    (println "\nEnter a stepValue: ") (flush)
    (read-string (read-line))

)

(defn printTemp[^Temperature aTemp]
    (print (getDegrees aTemp))
    (print " ")
    (print (getScale aTemp))
    (flush)

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            ADJUSTMENT OPERATIONS                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn raise [aTemp stepValue]
    (->Temperature (+ (getDegrees aTemp) stepValue) (getScale aTemp))
)


(defn lower [^Temperature aTemp stepValue]
    (if (checkTemp (- (getDegrees aTemp) stepValue) (getScale aTemp))
        ;;True Part
        (->Temperature (- (getDegrees aTemp) stepValue) (getScale aTemp))

        ;;False Part
        false   
    )


)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            RELATIONAL OPERATIONS                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn equals [t1 t2]
    (let [ temp1 (toF t1)
           temp2 (toF t2)
         ]

         (if (= (getDegrees temp1) (getDegrees temp2))
            ;;True Part
            true

            ;;False Part
            false          
         )
    )
)

(defn lessThen [lS rS]
    (let [ leftSide (toF lS)
           rightSide (toF rS)
         ]

         (if (= (getDegrees leftSide) (getDegrees rightSide))
            ;;True Part
            false

            ;;False Part
            (if (< (getDegrees leftSide) (getDegrees rightSide))
                ;;True Part
                true

                ;;Fales Part
                false
            )          
         )
    )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            CONSOLE FUNCTIONS                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn tableHeader []
    (print "\n\n\n\n-----------------------------Temperature Table----------------------------------")
    (print  (str "\n" "Fahrenheit\t" "\tCelsius\t\t" "\tKelvin" "\n")) 
    (flush)



)


(defn table [baseTemp limitTemp stepValue]
    
    
        ;;Fahrenheit 
        (printTemp (toF baseTemp))
        (print "\t\t\t")

        ;;Celsius
        (printTemp (toC baseTemp))
        (print "\t\t\t\t")

        ;;Kelvin
        (printTemp (toK baseTemp))
        (print "\n")
    


    (let [newTemp (raise baseTemp stepValue)] 
        (if (lessThen newTemp limitTemp)
            ;;True Part
            (table newTemp limitTemp stepValue)

            ;;False Part
            (print "\n")
        )
    )
)
