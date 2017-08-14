require_relative 'scraper'

list = []


def display_list(list)
  list.each_with_index do |gift, index|
    if gift[:check]
      puts "#{index + 1 }. [x]#{gift[:name][0..15].capitalize}"
    else
      puts "#{index + 1 }. [ ]#{gift[:name][0..15].capitalize}"
    end
  end
end

puts "Xmas List"

answer = nil

until answer == "exit"

  puts "What do you want to do Display|Add|Delete|Check|Ideas (or type 'exit' to quit)"
  answer = gets.chomp.downcase
  case answer
  when "display"
   display_list(list)
  when "add"
    puts "What would you like to add?"
    add_gift = gets.chomp.downcase
    list << {name: add_gift, check: false}
  when "delete"

    puts "What would you like to remove. Choose a number?"
    #display
   display_list(list)
    #prompt for numeber
    delete_at_index = gets.chomp.to_i
    #delete number
    list.delete_at(delete_at_index)
  when "check"
    puts "Which item would you like to check/uncheck? Choose a number"
    #display
    display_list(list)
    #prompt for number
    to_check_or_not_to_check = gets.chomp.to_i
    #uncheck/check item number
    list[to_check_or_not_to_check - 1][:check] = ! list[to_check_or_not_to_check - 1][:check]
  when "ideas"
    puts "What ideas are you looking for?"
    input = gets.chomp
    etsy_results = scraping(input)
    etsy_results.take(10).each_with_index do |title, index|
      puts "#{index + 1}. #{title[0..25]}..."
    end
    puts "Please make a choice (enter the item number)"
    etsy_index = gets.chomp.to_i
    list << {name: etsy_results[etsy_index - 1], check: false}

  end

end


