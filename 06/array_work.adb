-- array_work.adb
-- This program displays the values of an array on the screen, 
-- and lets a user input values to fill an array.  
-- Author: Brian Goins (bmg23)
-- Date: 03/11/2019
----------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO; 
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;

procedure array_work is 

    type Vector is array (Positive range <>) of Float; 
    size : Integer; 
    

    -------------------------------------------------
    -- readArray
    -- Input: size, and user input scanner. 
    -- Return: Array full of user inputed values. 
    -------------------------------------------------
    function readArray(size : Integer) return Vector is
    myArray : Vector(1..size); input : Float;  
    begin 
        for i in 1..size loop
            New_Line; 
            Put("Enter double value for index ");
            Put(i);
            Put(" : "); 
            Get(input);
            myArray(i) := input;
        end loop; 
        return myArray;
    end readArray; 
        

    --------------------------------------------------
    -- printArray, prints out the values in an array. 
    -- Input: an Array
    -- Output: ostream of array values
    --------------------------------------------------
    procedure printArray(A : in Vector) is 
    begin 
        New_Line; 
        Put("Current values in array: "); 

        for i in A'Range loop
            New_Line; 
            Put(A(i)); 
        end loop; 

        
    end printArray; 

begin
    
    New_Line; 
    Put("Enter the size of your array: "); 
    Get(size); 
    
    declare 
        myArray : Vector(1..size);

    begin
        myArray := readArray(size); 
        printArray(myArray); 
    end;

end array_work; 