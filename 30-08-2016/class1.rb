#multilevel inheritance
class A
  def add
   puts "addition"
  end
  def sub
    puts "sub"
  end
end
class C < A
  def del
    puts "delete"
  end
end
class B < C
  def addi
   puts "addition in b"
  end
end
b = B.new
b.addi
b.del
b.add
b.sub
