Script started on Sat 13 Apr 2019 07:21:59 PM EDT
bmg23@maroon30:~/214/projects/08$ c[Kc [Kd ru[K[KRuby
bmg23@maroon30:~/214/projects/08/Ruby$ cat *.rb
# Temperature.java, this class stores a 
# Degrees and Scale of a Temperature. 
#  
# Temp class: 
#      - Stores degrees and scale
#      - Accessors 
#      - Conversion Functions
#      - Relation Operations 
# 
# 
# Author: Brian Goins (bmg23)
# Date: 4/4/2019 
##########################################

class Temperature
    
    ###########################################################
    #                      INITIALIZATION                     #
    ###########################################################

    def initialize(degrees, scale)
        if tempCheck(degrees, scale)    
            @degrees = degrees
            @scale = scale
        end
    end

    ## GETTERS ##
    attr_reader :degrees, :scale
    ## SETTERS ##
    attr_accessor :degrees, :scale

    ###########################################################
    #                       CONVERTER                         #
    ###########################################################

    ## FAHRENHEIT ##
    def toF()
        if scale == "C"
            newDegrees = (@degrees*1.8) + 32
            return Temperature.new(newDegrees, "F")
        elsif scale == "K"
            newDegrees = ((@degrees - 273.15) * 1.8) + 32
            return Temperature.new(newDegrees, "F")
        else 
            return Temperature.new(@degrees, @scale)
        end
    end

    ## CELSIUS ##
    def toC()
        if scale == "F"
            newDegrees = (@degrees - 32) * 5/9
            return Temperature.new(newDegrees, "C")
        elsif scale == "K"
            newDegrees = @degrees - 273.15
            return Temperature.new(newDegrees, "C")
        else 
            return Temperature.new(@degrees, @scale)
        end
    end

    ## KELVIN ##
    def toK()
        if scale == "F"
            newDegrees = ((@degrees - 32) * 5/9) + 273.15
            return Temperature.new(newDegrees, "K")
        elsif scale == "C"
            newDegrees = @degrees + 273.15
            return Temperature.new(newDegrees, "K")
        else 
            return Temperature.new(@degrees, @scale)
        end
    end

    ###########################################################
    #                      I/O OPERATIONS                     #
    ###########################################################

    ## Read Temperature ##
    def readTemp()
        puts "Enter Temperature: "
        line = gets.chomp
        lineArray = line.split(" ")

        @degrees = lineArray[0].to_f
        @scale = lineArray[1]

        return Temperature.new(degrees, scale)

    end

    ## Print Temperature ##
    def printTemp()
        print @degrees.round
        print " "
        print @scale
    end

    ###########################################################
    #                  ADJUSTMENT OPERATIONS                  #
    ###########################################################

    ## Raise ##
    def raise(stepValue)
        @degrees += stepValue
    end

    ## Lower ##
    def lower(stepValue)
        newDegrees = degrees - stepValue
        if tempCheck(newDegrees, scale)
            @degrees -= stepValue
        end
    end

    ###########################################################
    #                  RELATONAL OPERATIONS                   #
    ###########################################################

    ## Equals ##
    def equals(temp1, temp2) 
        if temp1.toF.degrees == temp2.toF.degrees
            return true
        else
            return false
        end
    end 

    ## Less Than ##
    def lessThan(leftSide, rightSide)
        lsF = leftSide.toF()
        rsF = rightSide.toF()

        if lsF.degrees <= rsF.degrees
           return true
        else 
            return false
        end
    end

    ###########################################################
    #                     CHECK TEMP                          #
    ###########################################################
    # tempCheck()                                             #
    # In: var, var                                            #
    # Out: bool                                               #
    #                                                         #
    # Takes two variables,                                    #
    # Checks that they are actual                             #
    # temps and of correct scale.                             #
    ###########################################################

    def tempCheck(degrees, scale)
        if scale == "F" and degrees >= -459.67
            return true
        elsif scale == "C" and degrees >= -273.15
            return true
        elsif scale == "K" and degrees >= 0
            return true
        else
            return false
        end 
    end


end 
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
testTempbmg23@maroon30:~/214/projects/08/Ruby$ ruby TempTester.rb
Enter Temperature: 
0 F
Enter Temperature: 
100 C
Enter a stepValue: 
2.5


-----------------------------Temperature Table----------------------------------

Fahrenheit		Celsius			Kelvin
0 F			-18 C			255 K
3 F			-16 C			257 K
5 F			-15 C			258 K
8 F			-14 C			260 K
10 F			-12 C			261 K
13 F			-11 C			262 K
15 F			-9 C			264 K
18 F			-8 C			265 K
20 F			-7 C			266 K
23 F			-5 C			268 K
25 F			-4 C			269 K
28 F			-3 C			271 K
30 F			-1 C			272 K
33 F			0 C			273 K
35 F			2 C			275 K
38 F			3 C			276 K
40 F			4 C			278 K
43 F			6 C			279 K
45 F			7 C			280 K
48 F			9 C			282 K
50 F			10 C			283 K
53 F			11 C			285 K
55 F			13 C			286 K
58 F			14 C			287 K
60 F			16 C			289 K
63 F			17 C			290 K
65 F			18 C			291 K
68 F			20 C			293 K
70 F			21 C			294 K
73 F			23 C			296 K
75 F			24 C			297 K
78 F			25 C			298 K
80 F			27 C			300 K
83 F			28 C			301 K
85 F			29 C			303 K
88 F			31 C			304 K
90 F			32 C			305 K
93 F			34 C			307 K
95 F			35 C			308 K
98 F			36 C			310 K
100 F			38 C			311 K
103 F			39 C			312 K
105 F			41 C			314 K
108 F			42 C			315 K
110 F			43 C			316 K
113 F			45 C			318 K
115 F			46 C			319 K
118 F			48 C			321 K
120 F			49 C			322 K
123 F			50 C			323 K
125 F			52 C			325 K
128 F			53 C			326 K
130 F			54 C			328 K
133 F			56 C			329 K
135 F			57 C			330 K
138 F			59 C			332 K
140 F			60 C			333 K
143 F			61 C			335 K
145 F			63 C			336 K
148 F			64 C			337 K
150 F			66 C			339 K
153 F			67 C			340 K
155 F			68 C			341 K
158 F			70 C			343 K
160 F			71 C			344 K
163 F			73 C			346 K
165 F			74 C			347 K
168 F			75 C			348 K
170 F			77 C			350 K
173 F			78 C			351 K
175 F			79 C			353 K
178 F			81 C			354 K
180 F			82 C			355 K
183 F			84 C			357 K
185 F			85 C			358 K
188 F			86 C			360 K
190 F			88 C			361 K
193 F			89 C			362 K
195 F			91 C			364 K
198 F			92 C			365 K
200 F			93 C			366 K
203 F			95 C			368 K
205 F			96 C			369 K
208 F			98 C			371 K
210 F			99 C			372 K
Enter Temperature: 
0 K
Enter Temperature: 
212 F
Enter a stepValue: 
20.0


-----------------------------Temperature Table----------------------------------

Fahrenheit		Celsius			Kelvin
-460 F			-273 C			0 K
-424 F			-253 C			20 K
-388 F			-233 C			40 K
-352 F			-213 C			60 K
-316 F			-193 C			80 K
-280 F			-173 C			100 K
-244 F			-153 C			120 K
-208 F			-133 C			140 K
-172 F			-113 C			160 K
-136 F			-93 C			180 K
-100 F			-73 C			200 K
-64 F			-53 C			220 K
-28 F			-33 C			240 K
8 F			-13 C			260 K
44 F			7 C			280 K
80 F			27 C			300 K
116 F			47 C			320 K
152 F			67 C			340 K
188 F			87 C			360 K
bmg23@maroon30:~/214/projects/08/Ruby$ exit

Script done on Sat 13 Apr 2019 07:23:10 PM EDT
