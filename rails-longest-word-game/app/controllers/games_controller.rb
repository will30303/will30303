class GamesController < ApplicationController
  def game
    @grid = Array.new(rand(3..12)){('A'..'Z').to_a.sample}
    @start_time = Time.now
  end

  def score
    @answer = params[:attempt]
    @grid = params[:grid]
    @start_time = Time.parse(params[:start_time])
    @end_time = Time.now
    #check if the attempt is actually from the generated grid
    #check if the attempt is a word from the dictionary
    #check the time between the user started and the time the request was received
    #return a score and time
    @results = run_game(@answer, @grid, @start_time, @end_time)
  end

  private

  def included?(guess, grid)
    guess.chars.all? {|letter| guess.count(letter) <= grid.count(letter)}
  end

  def compute_score(answer, time_taken)
    answer.length * 100 - time_taken
  end

  def run_game(answer, grid, start_time, end_time)
    result = {time: end_time - start_time}
    score_and_message = score_and_message(answer, grid, result[:time])
    result[:score] = score_and_message.first
    result[:message] = score_and_message.last
    p end_time
    result
  end

  def score_and_message(answer, grid, time)
    if included?(answer.upcase, grid)
      if english_word?(answer)
        score = compute_score(answer, time)
        [score, "well done"]
      else
        [0, "not an english word"]
      end
    else
      [0, "not in the grid"]
    end
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end

end
