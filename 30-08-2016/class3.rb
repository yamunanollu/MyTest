#basic module program
module Book
  def less
   puts "lee in book"
  end
end
module Book
  def lesson
    puts "lesson in book"
  end
end
class A 
  include Book
  include Book
  def lesson
    super
    puts "lesson in a"
  end
end
a = A.new
a.lesson
a.less
