# Block example
[1,2,3].each { |x| puts x*2 }   

[1,2,3].each do |x|
  puts x*2                    
end
# Proc Examples             
p = Proc.new { |x| puts x*2 }
[1,2,3].each(&p)              

proc = Proc.new { puts "Hello World" }
proc.call
                     
# Lambda Examples            
lam = lambda { |x| puts x*2 }
[1,2,3].each(&lam)

lam = lambda { puts "Hello World" }
lam.call
