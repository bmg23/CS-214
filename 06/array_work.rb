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

main