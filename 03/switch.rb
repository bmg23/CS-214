## switch.rb
## Author: Brian Goins (bmg23)
## Date: 2/16/2019
###############################


#############################################
## Function letterGrade
## Input: average grade, Integer
## Output: letter grade, string
## Uses case statement to return letter grade.
##############################################

def letterGrade(average) 
    case (average / 10)
        when 9..10
            return "A"
        when 8..9
            return "B"
        when 7..8
            return "C" 
        when 6..7
            return "D"
        else 
            return "F"
    end
end  

if __FILE__ == $0 
    print "\nEnter average grade: "
    avgGrade = gets.chomp.to_f
    print "\nLetter Grade: "
    puts letterGrade(avgGrade)
    print "\n"
end 