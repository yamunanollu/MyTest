#program to sort the list of strings
  a = Array.new
  b = Array.new
  puts "enter number of strings to sort:"
  n = gets.to_i
  puts "enter strings:"
  for i in 0...n
     a[i]=gets.to_s
  end
  for i in 0...n
     for j in i...n
        if (a[i]>a[j])
          a[i],a[j]=a[j],a[i]
        end
     end
  end
  puts "alphabetical order is:"
  puts a
