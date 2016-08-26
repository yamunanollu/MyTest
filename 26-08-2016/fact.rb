#to find factorial of a number
  puts "enter value:"
  var = gets.chomp.to_i
  def facto(v)
  	fact=1
  	for i in 1..v
    	  if v==0 or v==1
            return 1
          else
            fact = fact*i
          end
  	end
    return fact
  end
  va=facto(var)
  puts "#{va}"
