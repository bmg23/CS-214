/* TempTester.java, Driver sed to test and run Temperature class.  
 * This program takes three values, and uses Temperature class
 * to create a table of values.  
 * Tests:
 *      - Input:  
 *          - baseTemp
 *          - limitTemp
 *          - stepValue
 *      -Output: 
 *          - Formatted table
 * 
 * Author: Brian Goins (bmg23)
 * Date: 4/5/2019
 *****************************************************************/
import java.util.Scanner; 


 public class TempTester {
    /**********************************************
     *Main: 
     * Calls table function while the user wants to 
     * keep entering values.  
     ***********************************************/ 
    public static void main(String[] args) {  
        
        table();

        table();    

        
     

    }

    /*********************************************
     *table(), sub-program that takes input  
     * from user and prints a formatted table. 
     **********************************************/

    public static void table() {
        //Initialize values used in table.         
        Temperature baseTemp = new Temperature(0.0, 'F'); 
        Temperature limitTemp = new Temperature(0.0, 'F');
        Temperature temp = new Temperature(0.0, 'F');
        Double stepValue = 0.0; 
        String line = ""; 

        //Test functions not used in tester class.
        assert baseTemp.equals(limitTemp); 
        
        baseTemp =  baseTemp.raise(baseTemp, stepValue); 
        assert baseTemp.getDegrees() == 2.5; 
        baseTemp = baseTemp.lower(baseTemp, stepValue);
        assert baseTemp.getDegrees() == 2.5;

       
        //Get values from user.
        Scanner keyboard = new Scanner(System.in); 
        
        System.out.print("\nEnter a Base Temperature: "); 
        line = keyboard.nextLine();
        baseTemp.readTemp(line);

        System.out.print("\nEnter a Limit Temperature: ");
        line = keyboard.nextLine();
        limitTemp.readTemp(line);

        System.out.print("\nEnter a Step Value: "); 
        stepValue = keyboard.nextDouble(); 

        
        //Print Table
        System.out.println("\n\n-----------------------------Temperature Table----------------------------------"); 
        System.out.print("\n" + "Fahrenheit\t" + "\tCelsius\t\t" + "\tKelvin" + "\n"); 

        while(baseTemp.lessThan(baseTemp, limitTemp)) {

            //Print the temp in Fahrenheit. 
            temp = baseTemp.toF();
            temp.printTemp();

            System.out.print("\t\t\t");

            //Print the temp in Celsius. 
            temp = baseTemp.toC();
            temp.printTemp();

            System.out.print("\t\t\t");

            //Print the temp in Kelvin. 
            temp = baseTemp.toK();
            temp.printTemp();

            System.out.print("\n");

            baseTemp = baseTemp.raise(baseTemp, stepValue); 
        }
        

    }

 }