Script started on Sat 13 Apr 2019 07:16:41 PM EDT
bmg23@maroon30:~/214/projects/08$ cd java
bash: cd: java: No such file or directory
bmg23@maroon30:~/214/projects/08$ cd Java
bmg23@maroon30:~/214/projects/08/Java$ dir
Temperature.class  Temperature.java  TempTester.class  TempTester.java
bmg23@maroon30:~/214/projects/08/Java$ cat *.java
/* Temperature.java, this class stores a 
 * Degrees and Scale of a Temperature. 
 *  
 * Temp class: 
 *      - Stores degrees and scale
 *      - Accessors 
 *      - Conversion Functions
 *      - Relation Operations 
 * 
 * 
 * Author: Brian Goins (bmg23)
 * Date: 4/4/2019 
 ************************************/ 
import java.util.*;
import java.lang.*; 
import java.math.*;

class Temperature 
{   
    /*****************************INITIALIZATION**********************/
    public Temperature(Double degrees, char scale) {
      if(tempCheck(degrees, scale)) {
          tempDegrees = degrees;
          tempScale = scale; 
      } else {
        System.out.println("Failed to initialize new Temp.");
      }
    
    }

    /*****************************GETTERS****************************/
     public Double getDegrees() {
        return tempDegrees; 
    }

    public char getScale() {
        return tempScale; 
    }

    /*****************************SETTERS****************************/
    public void setDegrees(double newDegrees) {
        if(tempCheck(newDegrees, tempScale)) {
            tempDegrees = newDegrees; 
        } else { 
            System.out.print("setDegrees(): New degrees failed.");  
        }
    }

    public void setScale(char newScale) {
        if(tempCheck(tempDegrees, newScale)) {
            tempScale = newScale; 
        } else { 
            System.out.print("setScale(): New scale failed."); 
        }
    }


    /*****************************CONVERTERS****************************/
    /* All converters
     * Receives: temperature object. 
     * Returns: temperature object converted
     * to a different scale. 
     * 
     *****************************************/ 
    
    //To Fahrenheit 
    public Temperature toF() {
        if(tempScale == 'C') { //Convert from Celsius
            Double newDegrees = (tempDegrees*1.8) + 32; 
            Temperature temp = new Temperature(newDegrees, 'F');
            return temp; 
        } 
        else if(tempScale == 'K') { //Convert from Kelvin
            Double newDegrees = ((tempDegrees - 273.15) * 1.8) + 32; 
            Temperature temp = new Temperature(newDegrees, 'F');
            return temp; 
        } else { //Return the same temperature. 
            Temperature temp = new Temperature(tempDegrees, tempScale); 
            return temp; 
        }
    }
    
    //To Celsius
    public Temperature toC() {
        if(tempScale == 'F') { //Convert from Fahrenheit 
            Double newDegrees = (tempDegrees - 32) * 5/9; 
            Temperature temp = new Temperature(newDegrees, 'C'); 
            return temp;
        } 
        else if(tempScale == 'K') { //Convert from Kelvin 
            Double newDegrees = (tempDegrees - 273.15); 
            Temperature temp = new Temperature(newDegrees, 'C');
            return temp; 
        } else { //Return the same temperature. 
            Temperature temp = new Temperature(tempDegrees, tempScale); 
            return temp; 
        }
    }

    //To Kelvin 
    public Temperature toK() {
        if(tempScale == 'F') { //Convert from Fahrenheit 
            Double newDegrees = ((tempDegrees - 32) * 5/9) + 273.15; 
            Temperature temp = new Temperature(newDegrees, 'K');
            return temp; 
        }
        else if(tempScale == 'C') { //Convert from Celsius
            Double newDegrees = (tempDegrees + 273.15); 
            Temperature temp = new Temperature(newDegrees, 'K');
            return temp; 
        } else { //Return the same temperature.  
            Temperature temp = new Temperature(tempDegrees, tempScale); 
            return temp; 
        }
    }
    
    
    /*********************************I/O OPERATIONS***********************************/
    public void readTemp(String line) { 
        String[] arrayLine = line.split(" "); 
    
        Double degrees = Double.valueOf(arrayLine[0]); 
        char scale = arrayLine[1].charAt(0); 
        scale = Character.toUpperCase(scale); 

        if(tempCheck(degrees, scale)) {
            setDegrees(degrees);
            setScale(scale);
        } else {
            System.out.print("\nNew temperature failed.\n");
        }
    }
    
    
    public void printTemp() {

        System.out.print(Math.round(tempDegrees) + " " + tempScale); 
    }

    /*******************************ADJUSTMENT OPERATIONS**********************/
    public Temperature raise(Temperature temp, double degrees) {
        Temperature newTemp = new Temperature(temp.getDegrees() + degrees, temp.getScale());
        return newTemp; 
    }

    public Temperature lower(Temperature temp, double degrees) {
        Temperature newTemp = temp; 
        
        if(tempCheck(temp.getDegrees() - degrees, temp.getScale())) {
            newTemp = new Temperature(temp.getDegrees() - degrees, temp.getScale());
            return newTemp; 
        } else {
            System.out.print("Temperature is too low!"); 
            return temp; 
        }

        

    }

    /*************************Relational Operations*****************************/
    public boolean equals(Temperature temp1, Temperature temp2) {
        
        Temperature temp1F = temp1.toF(); 
        Temperature temp2F = temp2.toF(); 

        //Return true if they are equal. 
        if(temp1F.getDegrees() == temp2F.getDegrees()) {
            return true; 
        } else {
            return false; 
        }

    }//End of Function equals()

    public boolean lessThan(Temperature leftSide, Temperature rightSide) {

        leftSide = leftSide.toF(); 
        leftSide = leftSide.toF(); 

        //Return true if left < right. 
        if(leftSide.getDegrees() <= rightSide.getDegrees()) {
            return true; 
        } else {
            return false; 
        }


    }//End of Function lessThan()




    /******************************
     * tempCheck()
     * In: var, var 
     * Out: bool
     * 
     * Takes two variables,
     * Checks that they are actual
     * temps and of correct scale. 
     ******************************/

    public boolean tempCheck(Double degrees, char scale) {
        
        //Check Fahrenheit
        if(scale == 'F' && degrees >= -459.67) {
            return true;
        }

        //Check Celsius
        else if(scale == 'C' && degrees >= -273.15) {
            return true;
        }

        //Check Calvin
        else if(scale == 'K' && degrees >= 0) {
            return true; 
        } 
        
        else {
            return false;
        } 

    } //End of Function tempCheck()

    //Class Variables
    private Double tempDegrees; 
    private char tempScale; 

}//End of Class Temperature/* TempTester.java, Driver sed to test and run Temperature class.  
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

 }bmg23@maroon30:~/214/projects/08/Java$ javac TempTester.java
bmg23@maroon30:~/214/projects/08/Java$ java TempTester

Enter a Base Temperature: 0 F

Enter a Limit Temperature: 100 C

Enter a Step Value: 2.5


-----------------------------Temperature Table----------------------------------

Fahrenheit		Celsius			Kelvin
0 F			-18 C			255 K
3 F			-16 C			257 K
5 F			-15 C			258 K
8 F			-14 C			260 K
10 F			-12 C			261 K
13 F			-11 C			262 K
15 F			-9 C			264 K
18 F			-8 C			265 K
20 F			-7 C			266 K
23 F			-5 C			268 K
25 F			-4 C			269 K
28 F			-2 C			271 K
30 F			-1 C			272 K
33 F			0 C			273 K
35 F			2 C			275 K
38 F			3 C			276 K
40 F			4 C			278 K
43 F			6 C			279 K
45 F			7 C			280 K
48 F			9 C			282 K
50 F			10 C			283 K
53 F			11 C			285 K
55 F			13 C			286 K
58 F			14 C			287 K
60 F			16 C			289 K
63 F			17 C			290 K
65 F			18 C			291 K
68 F			20 C			293 K
70 F			21 C			294 K
73 F			23 C			296 K
75 F			24 C			297 K
78 F			25 C			298 K
80 F			27 C			300 K
83 F			28 C			301 K
85 F			29 C			303 K
88 F			31 C			304 K
90 F			32 C			305 K
93 F			34 C			307 K
95 F			35 C			308 K
98 F			36 C			310 K
100 F			38 C			311 K

Enter a Base Temperature: 0 K

Enter a Limit Temperature: 212 F

Enter a Step Value: 20.0


-----------------------------Temperature Table----------------------------------

Fahrenheit		Celsius			Kelvin
-460 F			-273 C			0 K
-424 F			-253 C			20 K
-388 F			-233 C			40 K
-352 F			-213 C			60 K
-316 F			-193 C			80 K
-280 F			-173 C			100 K
-244 F			-153 C			120 K
-208 F			-133 C			140 K
-172 F			-113 C			160 K
-136 F			-93 C			180 K
-100 F			-73 C			200 K
-64 F			-53 C			220 K
-28 F			-33 C			240 K
8 F			-13 C			260 K
44 F			7 C			280 K
80 F			27 C			300 K
116 F			47 C			320 K
152 F			67 C			340 K
188 F			87 C			360 K
bmg23@maroon30:~/214/projects/08/Java$ exit

Script done on Sat 13 Apr 2019 07:18:08 PM EDT
