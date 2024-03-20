def iterate_letter_to_right (letter, right_position)
  letter_decimal_value = letter.ord
  return letter if letter == " " || !letter_decimal_value.between?(97, 122)

  abecedary_position = letter_decimal_value - 97
  new_abecedary_position = (abecedary_position + right_position) % 25
  (97 + new_abecedary_position).chr
end

def encrypt(text, right_position)
  letter_list = text.split("")
  upcase_indexes = letter_list.each_with_index.reduce([]) { |indexes_list, (letter, index)| letter == letter.upcase ? indexes_list << index : indexes_list }
  new_letter_list = letter_list.map { |letter| iterate_letter_to_right letter.downcase, right_position }
  upcase_indexes.each { |index| new_letter_list[index] = new_letter_list[index].upcase }
  new_letter_list.join("")
end
