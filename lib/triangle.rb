class Triangle
  attr_accessor :side_one, :side_two, :side_three

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def sort_sides
    [@side_one, @side_two, @side_three].sort!
  end

  def negative_side?
    if self.side_one < 0 || self.side_two < 0 || self.side_three < 0
      true
    else
      false
    end
  end

  def no_length?
    if self.side_one == 0 || self.side_two == 0 || self.side_three == 0
      true
    else
      false
    end
  end

  def inequal?
    if self.sort_sides[2] >= (self.sort_sides[0] + self.sort_sides[1])
      true
    else
      false
    end
  end

  def all_zero?
    if (@side_one + @side_two + @side_three) == 0
      true
    else
      false
    end
  end

  def valid?
    if self.all_zero? || self.inequal? || self.no_length? || self.negative_side?
      false
    else
      true
    end
  end


  def kind
    if self.valid? == false
      begin
        raise TriangleError
      end
    elsif @side_one == @side_two && @side_one == @side_three
      :equilateral
    elsif self.side_one != self.side_two && self.side_one != self.side_three && self.side_two != self.side_three
      :scalene
    else
      :isosceles
    end
  end
end

class TriangleError < StandardError
  def message
    puts "error"
  end
end
