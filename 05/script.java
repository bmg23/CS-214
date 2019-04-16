Script started on Tue 05 Mar 2019 08:15:02 PM EST
catbmg23@gold10:~/214/projects/05$ cat *.java
/*Quadratics.java
 * Program: uses a subprogram to compute the roots of 
 * a quadratic equation.
 * Author: Brian Goins (bmg23)
 * Date: 03/04/2019
********************************************************/

import java.util.Scanner; 
import java.lang.Math; 

public class Quadratic
{
    public static double root1; 
    public static double root2;


    public static void main(String[] args) {
        double a, b, c;
         
        root1 = root2 = 0.0; 
        Scanner keyboard = new Scanner(System.in); 
        
        System.out.print("\nQuadratic equation calculator: "); 
        
        System.out.print("\nA: ");
        a = keyboard.nextDouble();
        System.out.print("\nB: ");
        b = keyboard.nextDouble();
        System.out.print("\nC: ");
        c = keyboard.nextDouble();

       
       if (quadraticRoots(a,b,c))
       { 
            System.out.print("\n+x = " + root1);
            System.out.print("\n-x = " + root2);
            System.out.print("\n");
        }
        
        keyboard.close();
    }//end of Main. 

    public static boolean quadraticRoots(double a, double b, double c)
    {

        if (a != 0) 
        {
            double arg = Math.pow(b, 2.0) - 4 * a * c; 
            if (arg >= 0) {
                root1 = (-b + Math.sqrt(arg))/(2*a);
                root2 = (-b - Math.sqrt(arg))/(2*a); 

                

                return true; 
            } else {
                System.out.print("\n*** quadraticRoots(): b^2 - 4ac is negative!\n"); 
                root1 = root2 = 0.0;
                return false; 
            }
        } 
        else 
        {
            System.out.print("\n*** QuadraticRoots(): a is zero!\n"); 
            root1 = root2 = 0.0;
            return false; 
        }

        
    }//end of function quadraticRoots.



    
}//end of class Quadratic. 
bmg23@gold10:~/214/projects/05$ javac Quadratic.J[Kjava
bmg23@gold10:~/214/projects/05$ java Quadratic.[K

Quadratic equation calculator: 
A: -4

B: 5

C: 6

+x = -0.75
-x = 2.0
bmg23@gold10:~/214/projects/05$ java Quadratic

Quadratic equation calculator: 
A: 0

B: 1

C: 2

*** QuadraticRoots(): a is zero!
bmg23@gold10:~/214/projects/05$ java Quadratic

Quadratic equation calculator: 
A: 3

B: 4

C: 5

*** quadraticRoots(): b^2 - 4ac is negative!
bmg23@gold10:~/214/projects/05$ exit

Script done on Tue 05 Mar 2019 08:19:21 PM EST
