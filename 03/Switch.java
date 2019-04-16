/* switch.java 
 * Author: Brian Goins (bmg23)
 * Date: 2/16/2019 
 */ 

import java.util.Scanner; 

 public class Switch {

    public static void main(String[] args) {

        System.out.print("\nEnter the average grade: "); 
        
        Scanner keyboard = new Scanner(System.in); 
        
        int avg = keyboard.nextInt(); 
        System.out.println("\nLetter grade: " + letterGrade(avg));

        keyboard.close();
        
    }

    /*********************************************
    * Function letterGrade
    * Input: average grade, Integer
    * Output: letter grade, string
    * Uses case statement to return letter grade.
    *********************************************/
    public static Character letterGrade(int average) {
        switch (average / 10) {
            case 10: case 9:
                return 'A'; 
            case 8: 
                return 'B'; 
            case 7:
                return 'C'; 
            case 6: 
                return 'D'; 
            default:
                return 'F'; 
            
        }
    }
 }