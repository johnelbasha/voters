match_data = "John Doe".match(/^(\w+) (\w+)$/)
p match_data
puts "Firstname: #{match_data[1]}"
puts "Lastname: #{match_data[2]}"