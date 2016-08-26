 #sum of the elements in an array
 a = Array.new
 b = 0
 puts "enter number of eleents:"
 n = gets.to_i
 puts "enter elements:"
 for i in 0...n
   a[i] = gets.to_i
   b = b + a[i]
 end
 puts "sum of elements in array is :#{b}"
