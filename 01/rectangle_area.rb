#! /urs/bin/ruby
# rectangle_area.rb computes the area of the rectangle. 
# Input: the length and width of the rectangle
# Precodition: the length and width are positive. 
# Author: Brian Goins (bmg23)
# Date: 02/05/2019
#######################################################

def rectArea(length, width)
    length * width
end

if __FILE__ == $0
    puts "To compute the area of a rectangle,"
    print "enter the length: "
    length = gets.chomp.to_f
    print "enter the width"
    width = gets.chomp.to_f
    print "The area of the rectangle is: "
    puts rectArea(length, width)
end
