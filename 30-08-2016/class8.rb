#Create a class named 'Shape' with a method to print "This is This is shape". Then create two other classes named 'Rectangle', 'Circle' inheriting the Shape class, both having a method to print "This is rectangular shape" and "This is circular shape" respectively. Create a subclass 'Square' of 'Rectangle' having a method to print "Square is a rectangle". Now call the method of 'Shape' and 'Rectangle' class by the object of 'Square' class.
class Shape
  def print
    puts "This is shape"
  end
end
class Rectangle < Shape
  def prin
    puts "this is rectangular shape"
  end
end
class Circle < Shape
  def pri
    puts "this is circular shape"
  end
end
class Square < Rectangle
  def pr
    puts "square is a rectangle"
  end
end
squ = Square.new
squ.print
