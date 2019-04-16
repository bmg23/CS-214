-- temp_packae.adb, header file for 
-- temp_package.adb
-- Author: Brian Goins (bmg23)
-- Date: 4/4/2019 
-------------------------------------------




with Ada.Text_IO; use Ada.Text_IO;


package Temp_Package is 

    type Temperature is private; 

    -----------------------------Public Declarations--------------------------
    
    --Constructor 
    procedure Init(Tp : out Temperature; Degrees : in Float; Scale : in Character);


    --Getters
    function getDegrees( Tp : in Temperature ) return Float; 
    function getScale( Tp : in Temperature ) return Character; 

    --Setters
    function toF(Tp : Temperature) return Temperature;
    function toC(Tp : Temperature) return Temperature; 
    function toK(Tp : Temperature) return Temperature;

    --I/O Operations
    function readTemp(Tp : Temperature) return Temperature; 
    procedure printTemp(Tp : in Temperature);

    --Adjustment Operations
    function raiseTemp(temp : Temperature; stepValue : Float) return Temperature;
    function lowerTemp(temp : Temperature; stepValue : Float) return Temperature;

    --Relational Operations
    function equals(t1 : in Temperature; t2 : in Temperature) return Boolean; 
    function lessThan(leftSide : in Temperature; rightSide : in Temperature) return Boolean; 
    function tempCheck(degrees : Float; scale : Character) return Boolean; 




    -----------------------------Private Declarations-------------------------
    
    private 

        --Temperature 
        type Temperature is 
            record 
                MyDegrees : Float; 
                MyScale : Character; 
            end record; 


end Temp_Package; 
                