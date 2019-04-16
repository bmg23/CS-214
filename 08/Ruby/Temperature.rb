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
        