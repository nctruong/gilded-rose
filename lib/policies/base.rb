# Isolating code (policy - how to calculate quality for each item). If we want to add new policy:
# - adding new class and inherits Base.
# - override update method.
module Policies
  class Base
    MIN_QUALITY = 0
    MAX_QUALITY = 50
    
    attr_accessor :sell_in, :quality

    def initialize(item)
      @sell_in = item.sell_in
      @quality = item.quality
    end
    
    # Update quality. New policy must override this function.
    def update
      raise NotImplementedError
    end

    private

    # Still in selling date or out of date
    def sell_in?
      sell_in > 0
    end

    # Valid range of quality, normally from 0 to 50
    def valid_quality?
      quality < MAX_QUALITY && quality > MIN_QUALITY
    end

    # Define how to downgrade (negative number) or upgrade(positive number) quality.
    # @in_unit: number of units would be added or eliminated from current quality if "in" selling date.
    # @out_unit: number of units would be added or eliminated from current quality if "out" of date.
    def update_quality(in_unit, out_unit)
      sell_in? ? (quality + in_unit) : (quality + out_unit)
    end
  end

  # Normal item.
  class Standard < Base
    def update
      @quality = update_quality( -1, -2)
      valid_quality? ? quality : MIN_QUALITY
    end
  end

  class AgedBrie < Base
    def update
      @quality = update_quality( 1, 2)
      valid_quality? ? quality : MAX_QUALITY
    end
  end

  class BackstagePasses < Base
    def update
      if sell_in?
        @quality = quality + 1 if valid_quality?
        @quality = quality + 1 if valid_quality? && sell_in < 11
        @quality = quality + 1 if valid_quality? && sell_in < 6
      else
        @quality = 0
      end
      quality
    end
  end

  class Sulfuras < Base
    def update
      quality
    end
  end

  class Conjured < Base
    def update
      # Degrade in quality twice as fast as normal items
      @quality = update_quality( -2, -4)
      valid_quality? ? quality : MIN_QUALITY
    end
  end
end
# By adding new class which inherits Base class and implementing update method we make sure that we donn't make
# impacts on legacy code (other items). This also DUCK TYPING pattern.