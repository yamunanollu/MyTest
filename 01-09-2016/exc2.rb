#using raise and rescue in 2 methods
class Exp
  def div(a, b)
    raise 'divide by zeo' if b == 0
    @c = a / b
    puts @c
  end
  def res
    div(10, 0)
    rescue => e
      puts "i am rescued"
  end
end
ex = Exp.new
ex.res


