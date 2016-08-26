  #unique values in array
  a = Array.new
  b = Array.new
  puts "enter 5 numbers:"
  for j in 0...5
      a[j]=gets.to_i
  end
  for i in 0...5
     for j in i+1...5
        if a[i]==a[j]
           a.delete(j)
           a[j]=a[j+1]
           b[i]=a[i]
        else 
           b[i]=a[i]     
        end
     end
  end
  puts "unique values in the array is #{b}"
