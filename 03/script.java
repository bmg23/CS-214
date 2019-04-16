Script started on Wed 20 Feb 2019 11:28:13 AM EST
bmg23@gold29:~/214/projects/03$ javac Switch.java
bmg23@gold29:~/214/projects/03$ cat Switch.java
/*switch.java 
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







 }bmg23@gold29:~/214/projects/03$ java Switch

Enter the average grade: 100

Letter grade: A
bmg23@gold29:~/214/projects/03$ java Switch

Enter the average grade: 95

Letter grade: A
bmg23@gold29:~/214/projects/03$ java Switch

Enter the average grade: 85

Letter grade: B
bmg23@gold29:~/214/projects/03$ java Switch

Enter the average grade: 5

Letter grade: F
bmg23@gold29:~/214/projects/03$ java Switch

Enter the average grade: 75

Letter grade: C
bmg23@gold29:~/214/projects/03$ java Switch

Enter the average grade: 65

Letter grade: D
bmg23@gold29:~/214/projects/03$ java Switch

Enter the average grade: 55

Letter grade: F
bmg23@gold29:~/214/projects/03$ exit

Script done on Wed 20 Feb 2019 11:28:54 AM EST
