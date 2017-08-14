# Define list of items available in the store
# define an empty card
# welcome user to the store
# display items to the user
# ask what user wants to add to card
# Store items in cart
# keep asking until user wants to checkout

store = %w(roquefort camembert monterey gouda)
cart = []
puts "*" * 23
puts "Welcome to InstaCheese"
puts "*" * 23
puts "Here are our selection"
store.each_with_index do |cheese, index|
  puts "#{index + 1} #{cheese}"
end

purchase = nil

until purchase == ""
  puts "What do you want ot buy? (or hit enter to checkout)"
  purchase = gets.chomp

  if store.include? purchase
    cart << purchase
  else
    puts "We don't carry this cheese..try again"
  end
end
puts "here are your choices"
cart.each_with_index do |item, index|
  puts "#{index + 1 } - #{item}"
end

puts "Thanks for shopping"
