#write a function to calculate area and perimeter of a rectangle
class Function
  def area(l,b)
     area = l * b
     puts "area is #{area}"
     peri = 2 * (l + b)
     puts "perimeter is #{peri}"
  end
end
f = Function.new
f.area(5,2)
