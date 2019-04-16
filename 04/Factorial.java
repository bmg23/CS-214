/* factorial.java, takes an integer n and returns n!
 *
 * Author: Brian Goins
 * Date 2/26/2019 
 ****************************************************/ 



 import java.util.Scanner; 


 class Factorial {
     
    //Main: Prompts user for number and calls factorial function.
    public static void main(String[] args) {

        Scanner keyboard = new Scanner(System.in);
        System.out.print("\nEnter a number to get its factorial: "); 

        double n = keyboard.nextDouble();
        
        System.out.print("\n" + n);
        System.out.printf(" Factorial = %f", factorial(n)); 
        System.out.print("\n\n"); 


        keyboard.close();
    }

    public static double factorial(double n) {
        double answer = 1.0; 

        for(double i = 2; i <= n; ++i) {
            answer *= i; 
        }

        return answer; 
    }

   






 }