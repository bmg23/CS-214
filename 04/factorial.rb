# factorial.rb, takes an integer n and returns n!
#
# Author: Brian Goins
# Date 2/26/2019 
###################################################

def factorial(n) 
    
    answer = 1
    
    for i in 2..n do
        answer *= i
    end

    return answer

end 


if __FILE__ == $0
    print "\nEnter a number to get its factorial: "
    n = gets.chomp.to_f

    print "\nFactorial = "
    print factorial(n)
    print "\n\n"
end
