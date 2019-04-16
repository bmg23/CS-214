Script started on Tue 26 Feb 2019 08:26:51 PM EST
bmg23@maroon34:~/214/projects/04$ cat *.rb
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
bmg23@maroon34:~/214/projects/04$ factorial.rb
bash: factorial.rb: command not found
bmg23@maroon34:~/214/projects/04$ ruby factorial.rb

Enter a number to get its factorial: 2

Factorial = 2

bmg23@maroon34:~/214/projects/04$ ruby factorial.rb

Enter a number to get its factorial: 3

Factorial = 6

bmg23@maroon34:~/214/projects/04$ ruby factorial.rb

Enter a number to get its factorial: 7

Factorial = 5040

bmg23@maroon34:~/214/projects/04$ ruby factorial.rb

Enter a number to get its factorial: 8

Factorial = 40320

bmg23@maroon34:~/214/projects/04$ exit

Script done on Tue 26 Feb 2019 08:27:29 PM EST
