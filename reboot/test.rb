store = {
  "oreo" => 5,
  "loreal" => 50,
  "perrier" => 4,
  "water" => 2,
  "beer" => 2.50
}

your_cart = []

puts "Welcome to my limited store"
puts "Below are the items we carry"

store.each do |item, value|
 puts "#{item}- $#{value}"
 #oreo- 5$
end


to_buy = nil
total = 0

until to_buy == ""
  puts "Please add your items into the cart (hit enter to checkout)"
  to_buy = gets.chomp
  break if to_buy == ""
  if store.has_key?(to_buy)
    your_cart<< to_buy
    your_cart.each do |item|
      total += store[item]
    end
  else
    puts "We don't have that. Please try again"
  end
end

puts "x" * 20
puts your_cart
puts total


