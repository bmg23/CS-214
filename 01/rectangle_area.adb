-- rectangle_area.adb computes area of a rectangle
--
-- Input: Length and width of a rectangle.
-- Precondition: Length and width must be positive numbers.
-- Output: The area of a rectangle.
--
-- Author: Brian Goins (bmg23)
-- Date: 02/05/2019
-----------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO; 

procedure rectangle_area is
	
	width, length, area : float; 

	--Function rectArea
	function rectArea(length: in float; width: in float) return float is
		begin 
			return length * width; 
		end rectArea; 
begin 
	New_Line;
	
	Put_Line("To compute the area of a rectangle,"); 

	Put("enter the width: ");
	Get(width);

	New_Line;
	Put("enter the length: ");
	Get(length); 
	
	
	area := rectArea(length, width);
		
	New_Line;
	Put("The rectangles area is, ");
	Put(area);
	New_Line;
end rectangle_area;		
