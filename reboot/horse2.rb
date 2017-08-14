`say -v Cello "Welcome to the race"`

horses = ["Andy", "Lisa", "Andrew", "Reggy"]

`say -v Agnes "Meet your contestants"`
puts "Meet your contestants"

horses.each_with_index do |horse, index|
  puts "ID #{index + 1}: #{horse}"
end

puts "Which horse are you feeling lucky with today? Give the ID number"
horse_index = gets.chomp.to_i


horse_choice = horses[horse_index - 1]

random_result = horses.shuffle

puts "try to imagine the fake race happening..."
sleep 4

if horse_choice == random_result.first
  puts "great job you won an imaginary race"
else
  puts "You lost. Here are the result"
  random_result.each_with_index do |result, index|
    #Position 1 is (horse name)(ID number)
    id = horses.index(result) + 1
    puts "Position #{index + 1} is #{result} (ID #{id})"
  end
end

