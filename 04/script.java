Script started on Tue 26 Feb 2019 06:40:56 PM EST
bmg23@maroon34:~/214/projects/04$ cat Factorial.java
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

   






 }bmg23@maroon34:~/214/projects/04$ javac Factorial.java
bmg23@maroon34:~/214/projects/04$ java Factr[Korial

Enter a number to get its factorial: 2

2.0 Factorial = 2.000000

bmg23@maroon34:~/214/projects/04$ java Factorial

Enter a number to get its factorial: 3

3.0 Factorial = 6.000000

bmg23@maroon34:~/214/projects/04$ java Factorial

Enter a number to get its factorial: 7

7.0 Factorial = 5040.000000

bmg23@maroon34:~/214/projects/04$ exit

Script done on Tue 26 Feb 2019 06:42:05 PM EST
