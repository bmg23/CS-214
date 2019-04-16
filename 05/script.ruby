Script started on Tue 05 Mar 2019 08:36:52 PM EST
bmg23@gold10:~/214/projects/05$ cat *rb[K[K.rb
## Quadratics.rb
## Program: uses a subprogram to compute the roots of 
## a quadratic equation.
## Author: Brian Goins (bmg23)
## Date: 03/04/2019
#######################################################


def quadraticRoots(a, b, c) 
    if a != 0 
        args = (b * b) - (4 * a * c)
        if args >= 0
            root1 = (-b + Math.sqrt(args))/(2*a)
            root2 = (-b - Math.sqrt(args))/(2*a)
            array = [root1, root2, 1]
            return array
        else 
            print "\n*** quadraticRoots(): b^2 - 4ac is negative!"
            array = [0, 0, 0]
            return array
        end
    else 
        print "\n*** QuadraticRoots(): a is zero!"
        array = [0, 0, 0]
        return array
    end           
end


if __FILE__ == $0
    print "Quadratic Equation Calculator: "
    
    print "\nA: "
    a = gets.chomp.to_f

    print "\nB: "
    b = gets.chomp.to_f

    print "\nC: "
    c = gets.chomp.to_f


    array = quadraticRoots(a, b, c)
    root1 = array[0]
    root2 = array[1]
    torf = array[2]


    if torf > 0
        print "\n+x = "
        print root1
        
        print "\n-x = "
        print root2
    end 

    print "\n\n"
endbmg23@gold10:~/214/projects/05$ ruby quadratic.rb
Quadratic Equation Calculator: 
A: -4

B: 5

C: 6

+x = -0.75
-x = 2.0

bmg23@gold10:~/214/projects/05$ ruby quadratic.rb
Quadratic Equation Calculator: 
A: 0

B: 1

C: 2

*** QuadraticRoots(): a is zero!

bmg23@gold10:~/214/projects/05$ ruby quadratic.rb
Quadratic Equation Calculator: 
A: 3

B: 4

C: 5

*** quadraticRoots(): b^2 - 4ac is negative!

bmg23@gold10:~/214/projects/05$ exit

Script done on Tue 05 Mar 2019 08:37:19 PM EST
