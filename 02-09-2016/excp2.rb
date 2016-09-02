def add
  puts "inside add method"
  raise "print"
end
def prin
  puts "inside prin method"
  add()
end
begin
  prin()
rescue => detail
  print detail.message
end
