/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Brian Goins
 * Date: 03/29/19
 ************************************************************/

import java.util.Scanner; 

public class NameTester  
{

  public static void main(String[] args)
  {
    /***************
     *PROJECT TESTS
     ***************/

    //Test Mutators    
    Name testName = new Name("Brian", "Mitchell", "Goins"); 

    String first = "Joe"; 
    String middle = "Billy"; 
    String last = "Smith";
    
    testName.setFirst(first);
    testName.setMiddle(middle);
    testName.setLast(last);

    assert testName.getFirst().equals(first);
    assert testName.getMiddle().equals(middle);
    assert testName.getLast().equals(last);

    //Test Name Format
    assert testName.lfmi().equals("Smith, Joe B."); 

    //Get name input from user. 
    Scanner keyboard = new Scanner(System.in);    
    System.out.print("\nEnter your name: ");  

    testName.read(keyboard); 

    System.out.print("\nName entered: " + testName.toString()); 
    System.out.print("\nInitials: " + testName.lfmi() + "\n"); 

    /***************
     *LAB TESTS
     ***************/

    Name aName = new Name("John", "Paul", "Jones");

    assert aName.getFirst().equals("John") ;
    assert aName.getMiddle().equals("Paul") ;
    assert aName.getLast().equals("Jones") ;

    System.out.println(aName);
    assert aName.toString().equals("John Paul Jones");

    System.out.println("All tests passed!");

    keyboard.close(); 
  }
}

class Name 
{
  private String myFirst, myMiddle, myLast; 

  public Name(String first, String middle, String last) {
    myFirst = first;
    myMiddle = middle; 
    myLast = last; 
  }

  //Getters
  public String getFirst() {
    return myFirst;
  }


  public String getMiddle() {
    return myMiddle;
  }


  public String getLast() {
    return myLast;
  }

  //Setters
  public void setFirst(String aFirst) {
    myFirst = aFirst; 
  }
  
  public void setMiddle(String aMiddle) {
    myMiddle = aMiddle; 
  }
  
  public void setLast(String aLast) {
    myLast = aLast; 
  }
  
  //Other Functions 

  public void read(Scanner keyboard) {
    myFirst = keyboard.next();
    myMiddle = keyboard.next();
    myLast = keyboard.next();
  }

  public String lfmi() {
    return myLast + ", " + myFirst + " " + myMiddle.charAt(0) + "."; 
  }

  public String toString() {
    return myFirst + ' ' + myMiddle + ' ' + myLast;
  }



};

