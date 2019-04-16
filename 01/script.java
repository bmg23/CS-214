Script started on Tue 05 Feb 2019 07:20:02 PM EST
bmg23@gold34:~/214/projects/01$ javac RectangleArea.java
bmg23@gold34:~/214/projects/01$ java Rer        cat Rectangle. Area.java
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
bmg23@gold34:~/214/projects/01$ java Rev ctas ngle.a  Area. 


To compute the area of a rectangle,
enter the length: 15

and enter the width:2

The area is 30.0

bmg23@gold34:~/214/projects/01$ exit

Script done on Tue 05 Feb 2019 07:20:52 PM EST
