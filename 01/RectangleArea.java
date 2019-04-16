/* CircleArea.java computes the area of a circle.
 *
 * Input: The length and width of a rectangle.
 * Precondition: The length and width are positive numbers.
 * Output: The area of the a rectangle
 *
 * Author: Brian Goins (bmg23)
 * Date:02/05/2018
 **********************************************************/
import java.util.Scanner;

public class RectangleArea {

	//Function to calc rectangle's area.
	public static double rectArea(double l, double w) {
		return l * w; 

	}//Rectangle Area Method


	//Main Program
	public static void main(String[] args) {
		//Prompt for length and width. 
		System.out.println("\n\nTo compute the area of a rectangle,");
		System.out.print("enter the length: ");
		
		//Create a connection to the keyboard.
		Scanner keyboard = new Scanner(System.in); 

		double length = keyboard.nextDouble();
		
		System.out.print("\nand enter the width:");
		
		double width = keyboard.nextDouble();

		
      		// output area
      		System.out.println("\nThe area is " + rectArea(length, width) + "\n");
	}//Main Method
}//class RectangleArea
