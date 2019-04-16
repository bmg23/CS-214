# TempTester.java, Driver sed to test and run Temperature class.  
# This program takes three values, and uses Temperature class
# to create a table of values.  
# Tests:
#      - Input:  
#          - baseTemp
#          - limitTemp
#          - stepValue
#      -Output: 
#          - Formatted table
# 
# Author: Brian Goins (bmg23)
# Date: 4/5/2019
#################################################################


require_relative "Temperature"

def testTemp
    temp = Temperature.new(0.0, "F")
    baseTemp = Temperature.new(0.0, "F")
    limitTemp = Temperature.new(0.0, "F")
    stepValue = 0.0

    baseTemp = baseTemp.readTemp()
    limitTemp = limitTemp.readTemp()

    puts "Enter a stepValue: "
    stepValue = gets.chomp.to_f

    puts "\n\n-----------------------------Temperature Table----------------------------------"
    puts "\nFahrenheit\t\tCelsius\t\t\tKelvin\n"

    while temp.lessThan(baseTemp, limitTemp)
        #Fahrenheit 
        temp = baseTemp.toF()
        temp.printTemp()

        print "\t\t\t"
        
        #Celsius
        temp = baseTemp.toC()
        temp.printTemp()

        print "\t\t\t"

        #Kelvin
        temp = baseTemp.toK()
        temp.printTemp()

        print "\n"

        baseTemp.raise(stepValue)
    end 


end 

testTemp
testTemp