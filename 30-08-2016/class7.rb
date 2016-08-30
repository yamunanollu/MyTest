#Create a class named 'Rectangle' with two data members 'length' and 'breadth' and two methods to print the area and perimeter of the rectangle respectively Its constructor having parameters for length and breadth is used to initialize length and breadth of the rectangle. Let class 'Square' inherit the 'Rectangle' class with its constructor having a parameter for its side (suppose s) calling the constructor of its parent class as 'super(s,s)'. Print the area and perimeter of a rectangle and a square.
class Rectangle
  attr_accessor :l, :b
  def initialize(l,b)
   @length = l
   @breadth = b
  end
  def area
   are = @length * @breadth
   puts "area is #{are}"
  end
  def peri
   per = 2 * (@length + @breadth)
   puts "perimeter is :#{per}"
  end
end
class Square < Rectangle
  def initialize(s)
    super(s,s)
  end
end
rec = Rectangle.new(7,9)
rec.area
rec.peri
squ = Square.new(6)
squ.area
squ.peri

