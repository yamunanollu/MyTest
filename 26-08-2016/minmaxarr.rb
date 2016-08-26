#to find max and min values in an array  
  def max
    n = Array.new()
    a = Array.new()
    puts "enter no of elements:"
    n = gets.to_i
    puts "enter #{n} elements"
    for i in 0..n
       a[i] = gets.to_i
    end
    max = a[0]
    min = a[0]
    for i in 0..n
       if max < a[i]
          max =a [i]
       elsif min > a[i]
          min = a[i]
       end
    end
    puts "max is #{max}"
    puts "min is #{min}"
  end
  max
