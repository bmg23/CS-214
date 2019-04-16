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

}//End of Class Temperature