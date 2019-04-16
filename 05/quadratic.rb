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
end