# Define list of items available in the store
# define an empty cart
# welcome user to the store
# display items to the user with price
# ask what user wants to add to cart
# gets item from user
# Store items in cart and add up the price
# keep asking until user wants to checkout

store = {
  "oreo" => 5,
  "loreal" => 50,
  "perrier" => 4,
  "water" => 2,
  "beer" => 2.50
}


your_cart = {}

puts "Welcome to my limited store"
puts "Below are the items we carry"

store.each do |item, value|
 puts "#{item}- $#{value}"
 #oreo- 5$
end


to_buy = nil

until to_buy == ""
  puts "Please select the item you want to purchase(press enter to checkout)"
  to_buy = gets.chomp
  break if to_buy == ""
  if store.has_key?(to_buy) == false
    puts "We do not have that. Please try again"
  elsif store.has_key?(to_buy) == true
    puts "How many would you like?"
    user_quant = gets.chomp.to_i
    if store.has_key?(to_buy)
      if your_cart.has_key?(to_buy)
        your_cart[to_buy] += user_quant
      else
        your_cart[to_buy] = user_quant
      end
    end
  end
end

sub_total = 0
grand_total = 0
puts "x" * 20
your_cart.each do |key, quantity|
  sub_total = store[key] * quantity
  grand_total += sub_total
  # oreo x 3 =

  puts "#{key} x #{quantity} = #{sub_total}"
end



puts "Your grand total is: #{grand_total}"
puts "x" * 20











