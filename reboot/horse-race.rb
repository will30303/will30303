# welcome user
# display the hroses of the race
# ask the user which horse it wants to choose
# store the user choice
# pick random horse that wins
# compre user input with random computer sample
# display final result of the bet

puts "Welcome to the Kentucky Derby"

horses = ["Amazing Boris", "Furious Alice", "The Hammer", "KOW" ]

horses.each_with_index {|horse, index| puts "ID #{index + 1} #{horse} "}

puts "Which is your lucky number?"
horse_index = gets.chomp.to_i


bet = horses[horse_index - 1]

race_results = horses.shuffle



if bet == race_results[0]
  puts "you won"
else
  puts "you lost"
end


puts "The result was "
race_results.each_with_index do |horse, index|
  puts "position #{index + 1} #{horse} (ID #{horses.index(horse) + 1 }) "
end
