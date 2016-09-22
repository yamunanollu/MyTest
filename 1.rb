require 'rubygems'
require 'active_record'
require 'mysql'
begin
ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql2',
  :database => 'yamuna',
  :username => 'root',
  :password => 'root',
  :host     => 'localhost',
  :port     => 3306)
  ActiveRecord::Base.connection # Calls connection object
  puts "CONNECTED!" if ActiveRecord::Base.connected? 
  result1=Hash.new
  result2=Hash.new
  result3=Hash.new
  ActiveRecord::Base.connection.select_all('USE yamuna')
  f1 = File.open("yamuna.sql", "r")
  f2 = File.open("srikanth.sql","r")
  f3 = File.open("asha.sql","r")
  cou = 0
 begin 
  cou = cou+1
  a=f1.readline
  puts (a)
  ya = ActiveRecord::Base.connection.select_all(a)
  puts ya
  result1=ya
  puts "\n"
  b=f2.readline
  puts (b)
  sr = ActiveRecord::Base.connection.select_all(b)
  puts sr
  result2=sr
  puts "\n"
  c=f3.readline
  puts c
  as = ActiveRecord::Base.connection.select_all(c)
  puts as
  result3=as
  puts "\n"
  puts"#{cou}.............................."
  puts result1.to_a==result2.to_a ? "results 1 & 2 are same": "results 1 & 2 not same"
  puts result2.to_a==result3.to_a ? "results 2 & 3 are same": "results 2 & 3 not same"
  puts result3.to_a==result1.to_a ? "results 3 & 1 are same": "results 3 & 1 not same"
  puts "\n"
  if result1.to_a!=result2.to_a || result2.to_a!=result3.to_a || result3.to_a!=result1.to_a
    break
  end
  end until File.zero?("f1") && File.zero?("f2") && File.zero?("f3")
  puts "NOT CONNECTED!" unless ActiveRecord::Base.connected?
rescue Exception => e  
  puts e.message  
  puts e.backtrace.inspect  
end
