;;;; nameTester.clj creates and tests a clojure Name type.
;;;;
;;;; Output: results of testing Name functions.
;;;;
;;;; Usage: clojure -m nameTester
;;;;
;;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;;; Completed by: Brian Goins
;;;; Date: 03/29/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns nameTester)   ; program name


;;; define a Clojure record named Name 
;;; (which compiles to a Java class).

(defrecord Name [firstName, middleName, lastName])



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; make-Name constructs a Name from three strings. 
;;; Receive: firstN, middleN and lastN, three strings.
;;; Return: the Name (firstN middleN lastN). 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn make-Name [firstName, middleName, lastName]
  (->Name firstName middleName lastName)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFirst() extracts the first name of a Name object.
;;; Receive: aName, a Name.
;;; Return: the firstName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn getFirst [^Name aName]
  (:firstName aName)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getMiddle() extracts the middle name of a name object.
;;; Receive: aName, a Name. 
;;; Return: the middleName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn getMiddle [^Name aName]
  (:middleName aName)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLast() extracts the last name of a name object.
;;; Receive: aName, a Name. 
;;; Return: the lastName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn getLast [^Name aName]
  (:lastName aName)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          SETTERS                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn setFirst [aName newFirst]
  (->Name newFirst (:middleName aName) (:lastName aName))
)

(defn setMiddle [aName newMiddle]
  (->Name  (:firstName aName) newMiddle (:lastName aName))
)

(defn setLast [aName newLast]
  (->Name (:firstName aName) (:middleName aName) newLast)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFullName() returns a full name in F-M-L order. 
;;; Receive: aName, a Name. 
;;; Return: firstName, middleName, lastName,
;;;           separated by spaces. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn toString [^Name aName]
  (str (getFirst aName)
        " "
        (getMiddle aName)
        " "
        (getLast aName)
  )

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printName() displays a name object.
;;; Receive: aName, a Name.
;;; Output: the strings in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn printName [^Name aName]
  (print (toString aName))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lfmi() displays a name object.
;;; Receive: aName, a Name.
;;; Output: the name in special format
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn lfmi [aName]
  (let [first (getFirst aName) 
        middle (subs (getMiddle aName) 0 1)
        last (getLast aName)
      ]
    (str last ", " first " " middle ".")
  
  )


)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; read() takes in user input and sets the parts of a name
;;; Receive: user input
;;; Output: sets the name
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn readName []
  (println "\nPlease hit enter after entering each part of your name.")
  (println "\nEnter your name: ")
  (flush)


  (->Name (read-line) (read-line) (read-line)) 
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver to test our Name functions. 
;;; Output: the result of testing our Name functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [                                          ; 3 ways to construct an object:
      name1 (make-Name "John" "Paul" "Jones")  ; -using our "make-" constructor
      name2 (->Name "Jane" "Penelope" "Jones") ; -invoking constructor directly
                                               ; -mapping field-names to values
      name3 (map->Name {:lastName "Jones" :firstName "Jinx" :middleName "Joy"})
    ]
    ;; ----- SECTION 1 -----
    (println)
    (print name1) (println)
    (assert (= (getFirst name1) "John") "getFirst(1) failed")
    (assert (= (getMiddle name1) "Paul") "getMiddle(1) failed")
    (assert (= (getLast name1) "Jones") "getLast(1) failed")
    (assert (= (toString name1) "John Paul Jones") "toString(1) failed")
    (printName name1) (println)
    ;; ----- SECTION 2 -----
    (println)
    (print name2) (println)
    (assert (= (getFirst name2) "Jane") "getFirst(2) failed")
    (assert (= (getMiddle name2) "Penelope") "getMiddle(2) failed")
    (assert (= (getLast name2) "Jones") "getLast(2) failed")
    (assert (= (toString name2) "Jane Penelope Jones") "toString(2) failed")
    (printName name2) (println)
    ;; ----- SECTION 3 -----
    (println)
    (print name3) (println)
    (assert (= (getFirst name3) "Jinx") "getFirst(3) failed")
    (assert (= (getMiddle name3) "Joy") "getMiddle(3) failed")
    (assert (= (getLast name3) "Jones") "getLast(3) failed")
    (assert (= (toString name3) "Jinx Joy Jones") "toString(3) failed")
    (printName name3) (println)

    ;;------------------------------------PROJECT TESTS------------------------------------------

    ;;Test Setters
    
    (let [  testName (->Name "Brian" "Mitchell" "Goins")
            testName (setFirst testName "Joe")
            testName (setMiddle testName "Billy")
            testName (setLast testName "Smith")
          ]
      


      (assert (= (getFirst testName) "Joe") "setFirst() failed")
      (assert (= (getMiddle testName) "Billy") "setMiddle() failed")
      (assert (= (getLast testName) "Smith") "setLast() failed")

      ;;Test Name Format
      (assert (= (lfmi testName) "Smith, Joe B.") "lfmi() failed")
    )

    (let [ testName2 (readName) ]

      (print "\nEntered Name: ")
      (printName testName2)
      
      (print "\n")
      (print (lfmi testName2))
    )




    (println "\nAll tests passed!\n")
  )
)

