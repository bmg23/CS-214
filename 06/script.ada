Script started on Tue 12 Mar 2019 06:38:53 PM EDT
bmg23@gold33:~/214/projects/06$ cat *.adb
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

end array_work; bmg23@gold33:~/214/projects/06$ gnatmake array_work.adb
gcc-5 -c array_work.adb
gnatbind-5 -x array_work.ali
gnatlink-5 array_work.ali
bmg23@gold33:~/214/projects/06$ ./array_work 

Enter the size of your array: 4

Enter double value for index           1 : 54

Enter double value for index           2 : 2.36

Enter double value for index           3 : 0.214

Enter double value for index           4 : 548

Current values in array: 
 5.40000E+01
 2.36000E+00
 2.14000E-01
 5.48000E+02
bmg23@gold33:~/214/projects/06$ exit

Script done on Tue 12 Mar 2019 06:39:34 PM EDT
