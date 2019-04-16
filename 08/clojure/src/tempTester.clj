;; TempTester.clj, Driver sed to test and run Temperature class.  
;; This program takes three values, and uses Temperature class
;; to create a table of values.  
;; Tests:
;;      - Input:  
;;          - baseTemp
;;          - limitTemp
;;          - stepValue
;;      -Output: 
;;          - Formatted table
;; 
;; Author: Brian Goins (bmg23)
;; Date: 4/5/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(ns tempTester) ;program name
(load "Temperature")


(defn -main[]
   
   (let [
            baseTemp (readTemp)
            stepValue (readStepValue)
            limitTemp (readTemp)
            newTemp (toF baseTemp)
         ]     
        
      (tableHeader)
            
      (table baseTemp limitTemp stepValue)
      (print "\n")
   )

   (let [
            baseTemp (readTemp)
            stepValue (readStepValue)
            limitTemp (readTemp)
            newTemp (toF baseTemp)
         ]     
        
      (tableHeader)
            
      (table baseTemp limitTemp stepValue)
      (print "\n")
   )

)
