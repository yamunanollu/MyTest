#program to use ensure 
class Excp
  attr_accessor :a, :b
  def initializer(a, b)
    @a = a
    @b = b
  end
  def div
    raise 'divide by zero' if b == 0
  end
  def di
    div
    rescue => e
       puts "HAIIIII"
       puts e.message
    ensure
      @c = a / b
      puts @c
  end
end
excp = Excp.new
excp.a = 10
excp.b = 0
excp.di
  
  
    
