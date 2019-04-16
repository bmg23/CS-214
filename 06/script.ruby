Script started on Tue 12 Mar 2019 06:40:29 PM EDT
bmg23@gold33:~/214/projects/06$ cat *.rb
## array_work.rb
## This program displays the values of an array on the screen, 
## and lets a user input values to fill an array. 
## 
## Author: Brian Goins (bmg23)
## Date: 03/11/2019
########################################################


#################################################
## readArray
## Input: size, and user input scanner. 
## Return: Array full of user inputed values.
#################################################
def readArray(size)
    array = Array.new 

    for i in 1..size
        puts "\nEnter double value for index #{i}: "
        array[i-1] = gets.chomp.to_f
    end

    return array
end 

##################################################
## printArray, prints out the values in an array. 
## Input: an Array
## Output: ostream of array values
##################################################
def printArray(array)
    for i in array 
        print "\nArray value: "
        puts i 
    end 
end 


###########################################
## Main
## Prompts user to specify size of array. 
## Lets user input values into array. 
## Prints the resulting array
###########################################

def main 
    
    print "\nEnter the size of your array: "
   
    size = gets.chomp.to_i
    array = readArray(size)

    printArray(array)


end 

mainbmg23@gold33:~/214/projects/06$ ruby array_work.RB
ruby: No such file or directory -- array_work.RB (LoadError)
bmg23@gold33:~/214/projects/06$ ruby array_work.RB[K[Krb

Enter the size of your array: 4

Enter double value for index 1: 
1458

Enter double value for index 2: 
1.3698

Enter double value for index 3: 
6448

Enter double value for index 4: 
55546

Array value: 1458.0

Array value: 1.3698

Array value: 6448.0

Array value: 55546.0
bmg23@gold33:~/214/projects/06$ exit

Script done on Tue 12 Mar 2019 06:41:06 PM EDT
