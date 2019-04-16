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

end temp_tester; 