require "csv"

def make_letter_pool(arr, letter, frequency)
  frequency.times do
    arr.push(letter)
  end
  return arr
end

def draw_letters
  user_hand = []
  curr_letter = ""
  letter_pool = []
  letter_pool = make_letter_pool(letter_pool, "A", 9)
  letter_pool = make_letter_pool(letter_pool, "B", 2)
  letter_pool = make_letter_pool(letter_pool, "C", 2)
  letter_pool = make_letter_pool(letter_pool, "D", 4)
  letter_pool = make_letter_pool(letter_pool, "E", 12)
  letter_pool = make_letter_pool(letter_pool, "F", 2)
  letter_pool = make_letter_pool(letter_pool, "G", 3)
  letter_pool = make_letter_pool(letter_pool, "H", 2)
  letter_pool = make_letter_pool(letter_pool, "I", 9)
  letter_pool = make_letter_pool(letter_pool, "J", 1)
  letter_pool = make_letter_pool(letter_pool, "K", 1)
  letter_pool = make_letter_pool(letter_pool, "L", 4)
  letter_pool = make_letter_pool(letter_pool, "M", 2)
  letter_pool = make_letter_pool(letter_pool, "N", 6)
  letter_pool = make_letter_pool(letter_pool, "O", 8)
  letter_pool = make_letter_pool(letter_pool, "P", 2)
  letter_pool = make_letter_pool(letter_pool, "Q", 1)
  letter_pool = make_letter_pool(letter_pool, "R", 6)
  letter_pool = make_letter_pool(letter_pool, "S", 4)
  letter_pool = make_letter_pool(letter_pool, "T", 6)
  letter_pool = make_letter_pool(letter_pool, "U", 4)
  letter_pool = make_letter_pool(letter_pool, "V", 2)
  letter_pool = make_letter_pool(letter_pool, "W", 2)
  letter_pool = make_letter_pool(letter_pool, "X", 1)
  letter_pool = make_letter_pool(letter_pool, "Y", 2)
  letter_pool = make_letter_pool(letter_pool, "Z", 1)

  available_letters = []
  available_letters = letter_pool.dup

  10.times do
    curr_letter = letter_pool.sample
    user_hand.push(curr_letter)
    available_letters.delete(curr_letter)
  end
  return user_hand
end

def uses_available_letters?(input, letters_in_hand)
  input_letters = input.chars
  input_letters.each do |letter|
    if letters_in_hand.include?(letter)
      letters_in_hand.delete(letter)
    else
      return false
    end
  end
  return true
end

def score_word(word)
  score = 0
  word = word.downcase
  split_word = word.chars
  split_word.each do |letter|
    case letter
    when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
      score += 1
    when "d", "g"
      score += 2
    when "b", "c", "m", "p"
      score += 3
    when "f", "h", "v", "w", "y"
      score += 4
    when "k"
      score += 5
    when "j", "x"
      score += 8
    when "q", "z"
      score += 10
    end
  end
  if word.length >= 7 && word.length <= 10
    score += 8
  end
  return score
end

def highest_score_from(words)
  scored_words = []
  highest_scored_word = 0
  words.each do |word|
    scored_words << {:word => word, :score => score_word(word)}
  end

  highest_scored_word = scored_words.max_by do |scored_words|
    scored_words[:score]
  end

  highest_score = highest_scored_word[:score]
  highest_score_array = []
  scored_words.each do |word|
    if word[:score] == highest_score
      highest_score_array.push(word)
    end
  end

  if highest_score_array.length > 1
    highest_scored_word = highest_score_array.min_by { |words| words[:word].length }
    same_length = []
    highest_score_array.each do |word|
      if word[:word].length == 10
        highest_scored_word = word
        if word[:word].length == highest_scored_word[:word].length
          same_length.push(word)
          highest_scored_word = same_length.first
        end
      end
    end
  end

  return highest_scored_word
end

def is_in_english_dict?(input)
  dictionary = CSV.read("assets/dictionary-english.csv", headers: true).to_a.flatten
  return dictionary.any?(input) ? true : false
end
