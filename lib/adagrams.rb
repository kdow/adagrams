
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
