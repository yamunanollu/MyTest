#including the module which is present in another file
require_relative 'mod'
class B
  include A
  def print
    puts "hai.........."
  end
end
b = B.new
b.add(10, 20)
b.print
