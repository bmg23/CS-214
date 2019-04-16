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
