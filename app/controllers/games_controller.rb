class GamesController < ApplicationController
  def new
    @letters = ("A".."Z").to_a

    letters_amount = rand(5..10)

    @randomletters = generate_random_letters(letters_amount)
  end

  def score
    @longestword = params[:longestword]
    # given letters must be used ❌
    @result = check_letters(@longestword)
    # correct letters but no English word ❌
    # correct letters and English word ✅

  end

  def generate_random_letters(amount)
    amount.times.map {@letters.sample}
  end


  def check_letters(word)
    word_letters = word.split.upcase

    if word_letters.include?(@randomletters)
      "Congratulations! #{word} is great!"
    else
      "Sorry but #{word} can't be built out of #{@randomletters}"
    end
  end
end
