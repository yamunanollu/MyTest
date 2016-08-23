a=Array.new
puts "enter number of elements:"
n=gets.chomp.to_i
puts "enter elements:"
for j in 0..n-1
 a[j]=gets.chomp.to_f
end
print "elements in sorted order is: " 
for i in 0...n
 for j in i+1...n
  if a[i]>a[j]
    a[i],a[j]=a[j],a[i]
  end
 end
print "#{a[i]} " 
end
puts "\nmedian is :"
if a.length%2!=0
med=a.length+1/2
puts a[med]   
else
me=a.length/2
f=me-1
mid=(a[me]+a[f])/2
puts "#{mid}" 
end    
