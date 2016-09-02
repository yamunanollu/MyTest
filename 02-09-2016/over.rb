#example prog for overriding
class A
  def add(a, b)
    @c = a + b
    puts @c
  end
end
class B < A
  def add(c, d)
    @e = c - d 
    puts @e
  end
end
a = A.new
b = B.new
b.add(10, 20)
b.add(20, 10)
