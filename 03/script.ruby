Script started on Wed 20 Feb 2019 11:34:11 AM EST
bmg23@gold29:~/214/projects/03$ cat switch.rb
## switch.clj
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
end bmg23@gold29:~/214/projects/03$ ruby switch.rb

Enter average grade: 100

Letter Grade: A

bmg23@gold29:~/214/projects/03$ ruby switch.rb

Enter average grade: 95

Letter Grade: A

bmg23@gold29:~/214/projects/03$ ruby switch.rb

Enter average grade: 85

Letter Grade: B

bmg23@gold29:~/214/projects/03$ ruby switch.rb

Enter average grade: 75

Letter Grade: C

bmg23@gold29:~/214/projects/03$ ruby switch.rb

Enter average grade: 65

Letter Grade: D

bmg23@gold29:~/214/projects/03$ ruby switch.rb

Enter average grade: 55

Letter Grade: F

bmg23@gold29:~/214/projects/03$ exit

Script done on Wed 20 Feb 2019 11:34:39 AM EST
