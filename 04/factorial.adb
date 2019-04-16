-- factorial.adb, takes an integer n and returns n!
--
-- Author: Brian Goins
-- Date 2/26/2019 
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO; 
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure factorial is

    n : Integer; i : Integer; 

    function factorial( n : Integer) return Integer is 
    answer : Integer; 
    begin

        answer := 1; 
        i := 2; 

        for i in 2 .. n loop 
            answer := answer * i; 
        end loop; 

        return answer; 
    end;


--Main: Prompts user for number and calls factorial function.

begin 

    New_Line; 
    Put("Enter a number to get its factorial: "); 
    Get(n); 
    
    New_Line; 
    Put("Factorial = "); 
    Put(factorial(n)); 

end factorial; 
        

