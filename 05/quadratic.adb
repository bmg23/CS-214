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
