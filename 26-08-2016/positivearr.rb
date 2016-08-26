  #to return only positive values in an array 
  a = Array.new
  b = Array.new
  puts "enter number of elements:"
  n = gets.to_i
  puts "enter elements:"
  for i in 0...n
    a[i] = gets.to_f 
  end
  puts "positive elements in an array is:"
  for i in 0...n
    if a[i] > 0
      puts a[i]
    end
  end
