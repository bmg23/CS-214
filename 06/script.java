Script started on Tue 12 Mar 2019 06:38:06 PM EDT
bmg23@gold33:~/214/projects/06$ java[K[K[K[Kcat *.java
/* ArrayWork.java
 * This program displays the values of an array on the screen, 
 * and lets a user input values to fill an array. 
 * 
 * Author: Brian Goins (bmg23)
 * Date: 03/11/2019
 **************************************************************/
import java.io.*;
import java.util.Scanner;


public class ArrayWork
{

    /****************************************** 
     * Main
    * Prompts user to specify size of array. 
    * Lets user input values into array. 
    * Prints the resulting array
    *******************************************/
    public static void main(String[] args) {
        
        Scanner keyboard = new Scanner(System.in); 
        
        System.out.print("\nEnter the size of your array: "); 
        int size = keyboard.nextInt(); 
        
        double[] myArray = new double[size];

        readArray(myArray, keyboard); 
        printArray(myArray); 

        keyboard.close();
    }



    /**************************************************
     * readArray
     * Input: size, and user input scanner. 
     * Return: Array full of user inputed values. 
     ***************************************************/
    public static void readArray(double[] array, Scanner input) {
                        
        for (int i = 0; i < array.length; ++i) {
            System.out.print("\nEnter double value for index " + i + " :"); 
            array[i] = input.nextDouble(); 

        }

    }


    /**************************************************
     * printArray, prints out the values in an array. 
     * Input: an Array
     * Output: ostream of array values
     ***************************************************/
    public static void printArray(double[] array) {
        System.out.print("\nCurrent array values: \n");
        for (int i = 0; i < array.length; ++i) {
            System.out.print(array[i] + "\n"); 
        } 
    }



}//End of class ArrayWork bmg23@gold33:~/214/projects/06$ javac ArrayWork.java
bmg23@gold33:~/214/projects/06$ java ArrayWork.[K

Enter the size of your array: 4

Enter double value for index 0 :5.68

Enter double value for index 1 :7.45

Enter double value for index 2 :348

Enter double value for index 3 :3.65

Current array values: 
5.68
7.45
348.0
3.65
bmg23@gold33:~/214/projects/06$ exit

Script done on Tue 12 Mar 2019 06:38:47 PM EDT
