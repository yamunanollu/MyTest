#exmple program of exception handling
class Exp
  def div(a, b)
    raise 'divide by zeo' if b == 0
    @c = a / b
    puts @c
    rescue => e
      puts "i am rescued"
  end
end
ex = Exp.new
ex.div(10,0)

