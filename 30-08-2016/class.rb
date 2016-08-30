#inheritance
class A
  def shape
    puts "this is inside A's method"
  end
end
class B < A
  def shape
    super
    puts "this is inside B's method"
  end
end
b = B.new
b.shape
