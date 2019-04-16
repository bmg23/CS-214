Script started on Tue 05 Mar 2019 08:36:16 PM EST
bmg23@gold10:~/214/projects/05$ cat *.adb
-- Quadratics.adb
-- Program: uses a subprogram to compute the roots of 
-- a quadratic equation.
-- Author: Brian Goins (bmg23)
-- Date: 03/04/2019
-----------------------------------------------------


with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions;


procedure quadratic is 
    a, b, c, root1, root2 : Float;

    function quadraticRoots(a, b, c : Float) return boolean is
    arg : Float; 
    begin
        if a /= 0.0 then 
            
            arg := ((b**2.0) - (4.0 * (a * c))); 
            if arg >= 0.0 then 
                root1 := (-b + Sqrt(arg))/(2.0*a); 
                root2 := (-b - Sqrt(arg))/(2.0*a); 
                return true;
            else 
                New_Line;
                Put("*** quadraticRoots(): b^2 - 4ac is negative!");
                root1 := 0.0;
                root2 := 0.0;
                return false;  
            end if; 
        else
            New_Line;
            Put("*** QuadraticRoots(): a is zero!"); 
            root1 := 0.0;
            root2 := 0.0;                
            return false; 
        end if; 

    end; 


begin
New_Line;
Put("Quadratic equation calculator: ");

New_Line;
Put("A: ");
Get(a);

New_Line;
Put("B: ");
Get(b);

New_Line;
Put("C: ");
Get(c); 


if quadraticRoots(a, b, c) then 
    New_Line;
    Put("+x = ");
    Put(root1); 
    New_Line;
    Put("-x = ");
    Put(root2); 
end if; 

end quadratic;
bmg23@gold10:~/214/projects/05$ gnatmake quadratic
gnatmake: "quadratic" up to date.
bmg23@gold10:~/214/projects/05$ ./quadratic 

Quadratic equation calculator: 
A: -4

B: 5

C: 6

+x = -7.50000E-01
-x =  2.00000E+00
bmg23@gold10:~/214/projects/05$ ./quadratic 

Quadratic equation calculator: 
A: 0

B: 1

C: 2

*** QuadraticRoots(): a is zero!
bmg23@gold10:~/214/projects/05$ ./quadratic 

Quadratic equation calculator: 
A: 3

B: 4

C: 5

*** quadraticRoots(): b^2 - 4ac is negative!
bmg23@gold10:~/214/projects/05$ exit

Script done on Tue 05 Mar 2019 08:36:47 PM EST
