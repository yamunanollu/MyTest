#Print multiplication table of 14 from an array in which multiplication table of 12 is stored.
a = Array.new
b = Array.new
for i in 0..20
  a[i] = i * 12
end
print a
puts "\nmultiples of 14 using 12 is"
for i in 1..20
  b[i] = (a[i] + (2 * i))
  puts b[i]
end
