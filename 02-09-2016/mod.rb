#program using modules
module A
  def add(a, b)
    @c = a + b
    puts "addition is #{@c}"
  end
end
module B 
  include A
  def sub(a, b)
    @c = a - b
    puts "subtraction is #{@c}"
  end
end
class C
  include B
  def mul(a, b)
    @c = a * b
    puts "multiplication is #{@c}"
  end
end
c = C.new
c.add(20, 10)
c.sub(20, 10)
c.mul(20, 10)

