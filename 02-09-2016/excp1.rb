#using else in exceptions
def add
  div()
  raise 'nomethod'
  rescue Exception => e
    puts e.message
  else
    puts "method is exist"
end
#def div()
#end
add

