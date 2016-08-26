#puts "Danger Will Robinson!" * 5
#puts "A".ord
=begin
thing1 = "Red fish, "
thing2 = "blue fish."
string1 = thing1 + thing2 + " And so on and so forth."
string2 = "#{thing1 + thing2} And so on and so forth."
string3 = "#{thing1}#{thing2} And so on and so forth."
puts string1,string2,string3
end
thing = "Red fish"
thing.scan(/../) {|letter| puts letter}
end
puts "Yep, they mentioned Jabba in this one." if "Jabba the Hutt".match("Jab")
end
string1 = "2 + 4 = 4"
string2 = string1.sub("4", "5")
puts string1,string2
=end
nxt = "Next"
10.times { |nx| puts  nx=nxt.next! }
puts nxt
