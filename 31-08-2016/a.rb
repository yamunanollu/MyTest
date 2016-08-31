#Take 20 integer inputs from user and print the following:
#number of positive numbers
#number of negative numbers
#number of odd numbers
#number of even numbers
#number os 0.
class Array
  def met(*args)
   p=n=o=e=z=0
   args.each do |a|
     if a > 0
       p += 1
     end
     if a < 0
       n += 1
     end
     if a%2 == 0
       e +=1
     end
     if a%2 != 0
       o += 1
     end
     if a == 0
       z += 1
     end
   end
   puts "positive values #{p}"
   puts "negative values #{n}"
   puts "even values #{e}"
   puts "odd values #{o}"
   puts "zero values #{z}"
 end
end
array = Array.new
array.met(10,20,4,0,-1,2,3,4,5,6,0)
