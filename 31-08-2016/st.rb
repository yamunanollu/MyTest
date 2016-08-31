#Check the occurrence of the letter 'e' and the word 'is' in the sentence "This is umbrella"
st = String.new
st = "This is umbrella"
a = Array.new
cou = 0
con = 0
for i in 0..st.size
  if st[i] == "e" 
    cou += 1
  end
end
if st.include?"is"
    con += 1
end
puts "e occured in #{cou} times"
puts "is occured in #{con} times"
