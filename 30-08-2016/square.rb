#You are given with an array of integer elements. Make a new array which will store square of elements of previous array.
a = Array.new
b = Array.new
puts "enter number of elements"
n=gets.to_i
puts "enter elements:"
for i in 1..n
  a[i] = gets.to_i
end
print "square of elements is:"
for i in 1..n
  b[i] = a[i] * a[i]
  print "#{b[i]} "
end
  
