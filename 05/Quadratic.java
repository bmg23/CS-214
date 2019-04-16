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
