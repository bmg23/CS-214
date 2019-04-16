# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Brian Goins
# Date: 03/29/2019
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions

class Name 
    
    ###################### LAB METHODS ###################### 
    def initialize(first, middle, last)
        @first, @middle, @last = first, middle, last
    end
    
    ## GETTERS ##
    attr_reader :first, :middle, :last

    def fullName()
        return first + " " + middle + " " + last
    end 

    def print()
        puts fullName()
        return fullName()
    end

    ################### PROJECT METHODS ######################


    ## SETTERS ##
    attr_accessor :first, :middle, :last

    ## Name format ##
    def lfmi()
        return last + ", " + first + " " + middle[0,1] + "."
    end

    ## Read ##
    def read() 
        puts "\nEnter your name: "
        line = gets.chomp 

        lineArray = line.split(" ")
        
        @first = lineArray[0]
        @middle = lineArray[1]
        @last = lineArray[2]    
    end    


end


def testName
   
    
    ## LAB TESTS ##
    name = Name.new("John", "Paul", "Jones")

    assert name.first == "John", "first failed"
    assert name.middle == "Paul", "middle failed"
    assert name.last == "Jones", "last failed"
    assert name.fullName == "John Paul Jones", "fullName failed"
    assert name.print == "John Paul Jones", "print failed"
   
    ## PROJECT TESTS ##
    testName = Name.new("Brian", "Mitchell", "Goins")

    name.first = "Joe"
    name.middle = "Billy"
    name.last = "Smith"

    assert name.first == "Joe", "first failed"
    assert name.middle == "Billy", "middle failed"
    assert name.last == "Smith", "last failed"

    ## Get user input
    testName.read

    puts "\nName Entered: "
    testName.print 

    puts "Formatted Name: "
    puts testName.lfmi

   print "All tests passed!\n"
end

testName

