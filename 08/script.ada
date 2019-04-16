Script started on Sat 13 Apr 2019 07:19:50 PM EDT
bmg23@maroon30:~/214/projects/08$ cd Ada
bmg23@maroon30:~/214/projects/08/Ada$ dir
temp_package.adb  temp_package.ads  temp_package.ali  temp_package.o  temp_tester  temp_tester.adb  temp_tester.ali  temp_tester.o
bmg23@maroon30:~/214/projects/08/Ada$ cat temp_package.adb
-- temp_packae.adb, this class stores a 
-- Degrees and Scale of a Temperature. 
--  
-- Temp class: 
--      - Stores degrees and scale
--      - Accessors 
--      - Conversion Functions
--      - Relation Operations 
-- 
-- 
-- Author: Brian Goins (bmg23)
-- Date: 4/4/2019 
-------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;



package body Temp_Package is 

    -------------------------
    --Init
    -------------------------
    procedure Init(Tp : out Temperature; Degrees : in Float; Scale : in Character) is 
    begin 
        if(tempCheck(Degrees, Scale)) then  
            Tp.MyDegrees := Degrees;
            Tp.MyScale := Scale;
        end if;  
    end Init; 

    ----------------------------------------------------------------
    --                          GETTERS                           --
    ----------------------------------------------------------------
    function getDegrees(Tp : in Temperature) return Float is
    begin 
        return Tp.MyDegrees; 
    end getDegrees; 

    function getScale(Tp : in Temperature) return Character is 
    begin 
        return Tp.MyScale;
    end getScale; 

    ----------------------------------------------------------------
    --                          COVERTERS                         --
    ----------------------------------------------------------------
    -- All converters                                             --
    -- Receives: temperature object.                              --
    -- Returns: temperature object converted                      --
    -- to a different scale.                                      --
    ----------------------------------------------------------------

    --To Fahrenheit
    function toF(Tp : Temperature) return Temperature is 
        newDegrees : Float; 
        newTemp : Temperature;
    begin 
        if(getScale(Tp) = 'C') then --Convert from Celsius

            newDegrees := (Tp.MyDegrees*1.8) + 32.0;
            Init(newTemp, newDegrees, 'F');
            return newTemp;

        elsif(getScale(Tp) = 'K') then --Convert from Kelvin

            newDegrees := ((Tp.MyDegrees - 273.15) * 1.8) + 32.0; 
            Init(newTemp, newDegrees, 'F');
            return newTemp;
        else 
            return Tp; 
        end if; 
    end toF; 

    --To Celsius
    function toC(Tp : Temperature) return Temperature is 
        newDegrees : Float;
        newTemp : Temperature;
    begin 
        if(Tp.MyScale = 'F') then --Convert from Fahrenheit

            newDegrees := (Tp.MyDegrees - 32.0) * (5.0/9.0);  
            Init(newTemp, newDegrees, 'C');
            return newTemp;

        elsif(Tp.MyScale = 'K') then --Convert from Kelvin

           newDegrees := (Tp.MyDegrees - 273.15); 
           Init(newTemp, newDegrees, 'C');
           return newTemp;
        else 
            return Tp;
        end if; 
    end toC;

    --To Kelvin
    function toK(Tp : Temperature) return Temperature is 
        newDegrees : Float; 
        newTemp : Temperature;
    begin 
        if(Tp.MyScale = 'F') then --Convert from Fahrenheit

            newDegrees := ((Tp.MyDegrees - 32.0) * (5.0/9.0)) + 273.15; 
            Init(newTemp, newDegrees, 'K');
            return newTemp;

        elsif(Tp.MyScale = 'C') then --Convert from Celsius

           newDegrees := (Tp.MyDegrees + 273.15); 
           Init(newTemp, newDegrees, 'K');
           return newTemp;
        else 
            return Tp; 
        end if; 
    end toK;  
    
    ----------------------------------------------------------------
    --                       I/O OPERATIONS                       --
    ----------------------------------------------------------------
    --Read Temp
    function readTemp(Tp : Temperature) return Temperature is 
        degrees : Float; 
        scale : Character; 
        newTemp : Temperature; 
    begin 
        Put("Enter degrees: "); 
        Get(degrees);
        Put("Enter scale: ");
        Get(scale); 

        if(tempCheck(degrees, scale)) then 
            Init(newTemp, degrees, scale); 
            return newTemp; 
        else 
            Init(newTemp, 0.0, 'F');
            return newTemp; 
        end if; 
    end readTemp; 

    --Print Temp 
    procedure printTemp(Tp : in Temperature) is 
    begin 
        Put(getDegrees(Tp)); 
        Put(" ");
        Put(getScale(Tp)); 
    end printTemp; 

    ----------------------------------------------------------------
    --                    ADJUSTMENT OPERATIONS                   --
    ----------------------------------------------------------------
    --Raise 
    function raiseTemp(temp : Temperature; stepValue : Float) return Temperature is 
    newTemp : Temperature;
    newDegrees : Float; 
    begin 
        newDegrees := getDegrees(temp) + stepValue; 
        Init(newTemp, newDegrees, getScale(temp));
        return newTemp;
    end raiseTemp; 

    --Lower 
    function lowerTemp(temp : Temperature; stepValue : Float) return Temperature is
    newTemp : Temperature;
    newDegrees : Float; 
    begin 
        newDegrees := getDegrees(temp) + stepValue; 
        if(tempCheck(newDegrees, getScale(temp))) then 
            Init(newTemp, newDegrees, getScale(temp));
            return newTemp;
        else 
            return temp; 
        end if; 
    end lowerTemp;

    ----------------------------------------------------------------
    --                    RELATIONAL OPERATIONS                   --
    ----------------------------------------------------------------
    function equals(t1 : in Temperature; t2 : in Temperature) return Boolean is
    temp1 : Temperature;
    temp2 : Temperature;
    begin 
        temp1 := toF(t1); 
        temp2 := toF(t2); 

        if(getDegrees(temp1) = getDegrees(temp2)) then 
            return true; 
        else
            return false; 
        end if;


    end equals;

    function lessThan(leftSide : in Temperature; rightSide : in Temperature) return Boolean is
    lS : Temperature;
    rS : Temperature; 

    begin 
        lS := toF(leftSide);
        rS := toF(rightSide); 

        if(getDegrees(lS) <= getDegrees(rS)) then
            return true; 
        else    
            return false; 
        end if; 
    end lessThan; 

    -------------------------------
    -- tempCheck()
    -- In: var, var 
    -- Out: bool
    -- 
    -- Takes two
    -- Checks that they are actual
    -- temps and of correct scale. 
    --------------------------------
    function tempCheck(degrees : Float; scale : Character) return Boolean is  
    begin 
        if (scale = 'F' and degrees >= -459.67) then
            return true; 
        elsif (scale = 'C' and degrees >= -273.15) then 
            return true; 
        elsif (scale = 'K' and degrees >= 0.0) then 
            return true; 
        else 
            return false; 
        end if; 
    end tempCheck;  

end Temp_Package; 
bmg23@maroon30:~/214/projects/08/Ada$ cat temp_package.adb[K[Kds
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
                bmg23@maroon30:~/214/projects/08/Ada$ cat temp_tester.adb
--temp_tester.adb
--
--
--
--
---------------------------------------------------------

with temp_package; use temp_package; 
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure temp_tester is 

    baseTemp : Temperature;
    limitTemp : Temperature; 
    stepValue : Float;   


    procedure table(baseTemp : Temperature; limitTemp : Temperature; stepValue : Float) is
        temp : Temperature; 
    
    begin 
        temp := baseTemp; 
        --Print out table header.
        New_Line; New_Line;  
        Put("-----------------------------Temperature Table----------------------------------"); 
        New_Line; 
        put("   Fahrenheit       ");        put("Celsius              ");       put("Kelvin");    New_Line;  

        while lessThan(temp, limitTemp) 
        loop
            --Print temp in Fahrenheit. 
            temp := toF(temp); 
            printTemp(temp); 

            Put("   "); 

            --Print temp in Celsius
            temp := toC(temp); 
            printTemp(temp); 

            Put("    "); 


            --Print temp in Kelvin
            temp := toK(temp); 
            printTemp(temp); 

            New_Line; 

            --Raise baseTemp
            temp := raiseTemp(temp, stepValue);

        end loop; 
    
    end table; 
        





begin 
   baseTemp := readTemp(baseTemp); 
   limitTemp := readTemp(limitTemp); 
   
   New_Line;   
   Put("Enter a stepValue: "); 
   Get(stepValue); 

   table(baseTemp, limitTemp, stepValue);  

   baseTemp := readTemp(baseTemp); 
   limitTemp := readTemp(limitTemp); 
   
   New_Line;   
   Put("Enter a stepValue: "); 
   Get(stepValue); 

   table(baseTemp, limitTemp, stepValue);  

end temp_tester; bmg23@maroon30:~/214/projects/08/Ada$ gnatmake temp_tester
gcc-5 -c temp_tester.adb
temp_tester.adb:64:25: warning: "baseTemp" may be referenced before it has a value
temp_tester.adb:65:26: warning: "limitTemp" may be referenced before it has a value
gnatbind-5 -x temp_tester.ali
gnatlink-5 temp_tester.ali
bmg23@maroon30:~/214/projects/08/Ada$ ./temp_tester 
Enter degrees: 0  
Enter scale: F
Enter degrees: 100
Enter scale: C

Enter a stepValue: 2.5


-----------------------------Temperature Table----------------------------------
   Fahrenheit       Celsius              Kelvin
 0.00000E+00 F   -1.77778E+01 C     2.55372E+02 K
 4.50001E+00 F   -1.52778E+01 C     2.57872E+02 K
 9.00001E+00 F   -1.27778E+01 C     2.60372E+02 K
 1.35000E+01 F   -1.02778E+01 C     2.62872E+02 K
 1.80000E+01 F   -7.77777E+00 C     2.65372E+02 K
 2.25000E+01 F   -5.27777E+00 C     2.67872E+02 K
 2.70000E+01 F   -2.77777E+00 C     2.70372E+02 K
 3.15000E+01 F   -2.77771E-01 C     2.72872E+02 K
 3.60000E+01 F    2.22223E+00 C     2.75372E+02 K
 4.05000E+01 F    4.72223E+00 C     2.77872E+02 K
 4.50000E+01 F    7.22223E+00 C     2.80372E+02 K
 4.95000E+01 F    9.72223E+00 C     2.82872E+02 K
 5.40000E+01 F    1.22222E+01 C     2.85372E+02 K
 5.85000E+01 F    1.47222E+01 C     2.87872E+02 K
 6.30000E+01 F    1.72222E+01 C     2.90372E+02 K
 6.75000E+01 F    1.97222E+01 C     2.92872E+02 K
 7.20000E+01 F    2.22222E+01 C     2.95372E+02 K
 7.65000E+01 F    2.47222E+01 C     2.97872E+02 K
 8.10000E+01 F    2.72222E+01 C     3.00372E+02 K
 8.55000E+01 F    2.97222E+01 C     3.02872E+02 K
 9.00000E+01 F    3.22222E+01 C     3.05372E+02 K
 9.45000E+01 F    3.47222E+01 C     3.07872E+02 K
 9.90000E+01 F    3.72222E+01 C     3.10372E+02 K
 1.03500E+02 F    3.97222E+01 C     3.12872E+02 K
 1.08000E+02 F    4.22222E+01 C     3.15372E+02 K
 1.12500E+02 F    4.47222E+01 C     3.17872E+02 K
 1.17000E+02 F    4.72222E+01 C     3.20372E+02 K
 1.21500E+02 F    4.97222E+01 C     3.22872E+02 K
 1.26000E+02 F    5.22222E+01 C     3.25372E+02 K
 1.30500E+02 F    5.47222E+01 C     3.27872E+02 K
 1.35000E+02 F    5.72222E+01 C     3.30372E+02 K
 1.39500E+02 F    5.97222E+01 C     3.32872E+02 K
 1.44000E+02 F    6.22222E+01 C     3.35372E+02 K
 1.48500E+02 F    6.47222E+01 C     3.37872E+02 K
 1.53000E+02 F    6.72222E+01 C     3.40372E+02 K
 1.57500E+02 F    6.97222E+01 C     3.42872E+02 K
 1.62000E+02 F    7.22222E+01 C     3.45372E+02 K
 1.66500E+02 F    7.47222E+01 C     3.47872E+02 K
 1.71000E+02 F    7.72222E+01 C     3.50372E+02 K
 1.75500E+02 F    7.97222E+01 C     3.52872E+02 K
 1.80000E+02 F    8.22222E+01 C     3.55372E+02 K
 1.84500E+02 F    8.47222E+01 C     3.57872E+02 K
 1.89000E+02 F    8.72222E+01 C     3.60372E+02 K
 1.93500E+02 F    8.97222E+01 C     3.62872E+02 K
 1.98000E+02 F    9.22222E+01 C     3.65372E+02 K
 2.02500E+02 F    9.47222E+01 C     3.67872E+02 K
 2.07000E+02 F    9.72222E+01 C     3.70372E+02 K
 2.11500E+02 F    9.97222E+01 C     3.72872E+02 K
Enter degrees: 0
Enter scale: K
Enter degrees: 212
Enter scale: F

Enter a stepValue: 20.0


-----------------------------Temperature Table----------------------------------
   Fahrenheit       Celsius              Kelvin
-4.59670E+02 F   -2.73150E+02 C     0.00000E+00 K
-4.23670E+02 F   -2.53150E+02 C     2.00000E+01 K
-3.87670E+02 F   -2.33150E+02 C     4.00000E+01 K
-3.51670E+02 F   -2.13150E+02 C     6.00000E+01 K
-3.15670E+02 F   -1.93150E+02 C     7.99999E+01 K
-2.79670E+02 F   -1.73150E+02 C     9.99999E+01 K
-2.43670E+02 F   -1.53150E+02 C     1.20000E+02 K
-2.07670E+02 F   -1.33150E+02 C     1.40000E+02 K
-1.71670E+02 F   -1.13150E+02 C     1.60000E+02 K
-1.35670E+02 F   -9.31501E+01 C     1.80000E+02 K
-9.96701E+01 F   -7.31501E+01 C     2.00000E+02 K
-6.36701E+01 F   -5.31501E+01 C     2.20000E+02 K
-2.76701E+01 F   -3.31501E+01 C     2.40000E+02 K
 8.32990E+00 F   -1.31501E+01 C     2.60000E+02 K
 4.43299E+01 F    6.84995E+00 C     2.80000E+02 K
 8.03299E+01 F    2.68499E+01 C     3.00000E+02 K
 1.16330E+02 F    4.68499E+01 C     3.20000E+02 K
 1.52330E+02 F    6.68499E+01 C     3.40000E+02 K
 1.88330E+02 F    8.68499E+01 C     3.60000E+02 K
bmg23@maroon30:~/214/projects/08/Ada$ exit

Script done on Sat 13 Apr 2019 07:21:41 PM EDT
