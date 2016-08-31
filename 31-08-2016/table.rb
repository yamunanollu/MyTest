#Print multiplication table of 12 using recursion.
class Rec
  def rec(n,i)
   if i >= 0
     puts n*i
     i -= 1
     rec(n,i)
   end
  end
end
re = Rec.new
c = re.rec(12,12)
puts c
