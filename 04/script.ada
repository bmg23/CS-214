Script started on Tue 26 Feb 2019 07:21:46 PM EST
bmg23@maroon34:~/214/projects/04$ cat factorial.adb
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

begin 

    New_Line; 
    Put("Enter a number to get its factorial: "); 
    Get(n); 
    
    New_Line; 
    Put("Factorial = "); 
    Put(factorial(n)); 

end factorial; 
        

bmg23@maroon34:~/214/projects/04$ gnatmake factorial.adb
gnatmake: "factorial" up to date.
bmg23@maroon34:~/214/projects/04$ ./factorial 

Enter a number to get its factorial: 2

Factorial =           2
bmg23@maroon34:~/214/projects/04$ ./factorial 

Enter a number to get its factorial: 3

Factorial =           6
bmg23@maroon34:~/214/projects/04$ ./factorial 

Enter a number to get its factorial: 7

Factorial =        5040
bmg23@maroon34:~/214/projects/04$ exit

Script done on Tue 26 Feb 2019 07:22:24 PM EST
