Script started on Tue 02 Apr 2019 06:54:47 PM EDT
bmg23@maroon29:~/214/projects/07$ cat *.adb
-- namer.adb "test-drives" the Name type.
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Brian Goins
-- Date: 03/29/2019
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure name_tester is
  NAME_SIZE : integer := 8; 

 

  type Name is record 
      MyFirst : String(1..NAME_SIZE); 
      MyMiddle : String(1..NAME_SIZE); 
      MyLast : String(1..NAME_SIZE); 
  end record; 
 

  aName : Name ;


  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: theName, the Name variable;      -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------
  
  procedure Init (TheName : out Name; First, Middle, Last : in String) is
  begin
      TheName.MyFirst := First;
      TheName.MyMiddle := Middle;
      TheName.MyLast := Last;
  end Init;



  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------

  function getFirst(TheName : in Name) return String is 
  begin
    return TheName.MyFirst;
  end getFirst; 

  function getMiddle(TheName : in Name) return String is 
  begin
    return TheName.MyMiddle;
  end getMiddle; 

  function getLast(TheName : in Name) return String is 
  begin
    return TheName.MyLast;
  end getLast; 


  ----------------------------------------------
  --                SETTERS                   --
  ----------------------------------------------
  procedure setFirst(first : String; TheName: out Name) is 
  begin 
    TheName.MyFirst := first; 
  end setFirst;

  procedure setMiddle(middle : String; TheName: out Name) is 
  begin 
    TheName.MyMiddle := middle;  
  end setMiddle;

  procedure setLast(last : String; TheName: out Name) is 
  begin 
    TheName.MyLast := last; 
  end setLast;


  -----------------------------------------------
  -- getFullName(Name) retrieves Name as a String  -
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of theName -
  -----------------------------------------------

  function getFullName(TheName : in Name) return String is
  begin
    return TheName.MyFirst & " " & TheName.MyMiddle & " " & TheName.MyLast;
  end getFullName; 

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, to the screen.           -
  ----------------------------------------------

  procedure Put(TheName : in Name) is 
  begin 
    Put(getFullName(TheName)); 
  end Put; 


  ---------------------------------------------------  
  --lfmi(Name) displays First, Last Middle Initial. -
  --PRE: theName has been initialized.              -
  --Receive: theName, a Name.                       -
  --Output: First, Last Middle Initial.             -
  ---------------------------------------------------
  function lfmi(TheName : in Name) return String is
  begin 

    return  TheName.MyLast & ", " & TheName.myFirst & " " & TheName.MyMiddle(TheName.MyMiddle'First) & "."; 

  end lfmi; 

  ---------------------------------------------------  
  --read(Name) Takes in user input and sets the name-
  --PRE: theName has been initialized.              -
  --Receive: theName, a Name.                       -
  ---------------------------------------------------
  procedure read(TheName : out Name) is 
    first : String(1..NAME_SIZE);
    middle : String(1..NAME_SIZE);
    last : String(1..NAME_SIZE);

  begin 
    New_line; 
    Put("Enter all parts of your name with 8 Characters, use spaces to fill.");

    New_line;
    Put("Enter First Name: "); 
    Get(first); 
    
    New_line;
    Put("Enter Middle Name: "); 
    Get(middle); 

    New_line;
    Put("Enter Last Name: ");
    Get(last); 

    TheName.MyFirst := first;
    TheName.MyMiddle := middle;
    TheName.MyLast := last; 

  end read; 


begin

  Init(aName, "Brian   ", "Mitchell", "Goins   ");

  --PROJECT TESTS
  
  --Test Setters
  setFirst("Joe     ", aName);
  setMiddle("Billy   ", aName); 
  setLast("Smith   ", aName); 

  pragma Assert( getFirst(aName) = "Joe     ", "getFirst() failed");
  pragma Assert( getMiddle(aName) = "Billy   " , "getMiddle() failed");
  pragma Assert( getLast(aName) = "Smith   ", "getLast() failed");

  --Test Initials
  pragma Assert( lfmi(aName) = "Smith   , Joe      B.", "lmfi() failed"); 

  --Get name input from user
  read(aName); 

  Put("Name Entered: "); Put(aName); New_line; 
  Put(lfmi(aName)); New_line; 



  --LAB TESTS

  setFirst("John    ", aName);
  setMiddle("Paul    ", aName); 
  setLast("Jones   ", aName); 



  pragma Assert( getFirst(aName) = "John    ", "getFirst() failed");
  pragma Assert( getMiddle(aName) = "Paul    ", "getMiddle() failed");
  pragma Assert( getLast(aName) = "Jones   ", "getLast() failed");
  pragma Assert( getFullName(aName) = "John     Paul     Jones   ", 
                    "getFullName() failed");

   Put(aName); New_line;
   Put("All tests passed!"); New_line;

end name_tester;

bmg23@maroon29:~/214/projects/07$ make ada
make: Nothing to be done for 'ada'.
bmg23@maroon29:~/214/projects/07$ ./name_tester 

Enter all parts of your name with 8 Characters, use spaces to fill.
Enter First Name: Rick    

Enter Middle Name: C137    

Enter Last Name: s Sanchez 
Name Entered: Rick     C137     Sanchez 
Sanchez , Rick     C.
John     Paul     Jones   
All tests passed!
bmg23@maroon29:~/214/projects/07$ exit

Script done on Tue 02 Apr 2019 06:55:56 PM EDT
