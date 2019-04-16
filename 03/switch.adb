-- switch.adb
-- Author: Brian Goins (bmg23)
-- Date: 2/16/2019
--------------------------------

with Ada.text_IO, Ada.Integer_Text_IO; 
use Ada.text_IO, Ada.Integer_Text_IO;


procedure switch is 

    avgGrade : Integer; 
    ---------------------------------------------
    --Function letterGrade
    --Input: average grade, Integer
    --Output: letter grade, string
    --Uses case statement to return letter grade.
    ----------------------------------------------
    function letterGrade(average : Integer) return Character is 
    begin 
        case (average / 10) is 
            when 9 | 10 =>
                return 'A'; 
            when 8 =>
                return 'B';
            when 7 =>
                return 'C';
            when 6 =>
                return 'D';
            when others =>
                return 'F'; 
        end case; 
    end letterGrade;

begin 
    New_Line; 
    Put("Enter the average grade: "); 
    Get(avgGrade); 

    New_Line; 
    Put("Letter grade: ");
    Put(letterGrade(avgGrade)); 
end switch; 