  #array methods
  array1 = ["hello", "this", "is", "an", "array!"]
  array2 = []
  array2 << "This"  
  array2 << "is"    
  array2 << "also"  
  array2 << "an"    
  array2 << "array!"
  puts array2.pop
  puts array1 <=> array2
  puts array1|array2
  puts array1[1]
  puts array2.empty?
  puts array1.include?("an")
  puts array1.length
  puts array2.reverse
  puts array1.sort
