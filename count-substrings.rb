def count_substring(text, word)
  number_of_appearances = 0
  loop do
      new_text = text.sub word, ""
      break if new_text == text
      number_of_appearances += 1
      text = new_text
  end
  number_of_appearances
end

def substrings(text, dictionary)
  # With the reduce method, create a hash that will contain the dictionary 
  #and the number of times each word is in the main string
  dictionary.reduce({}) do |count_dictionary, word|
      # get the number of times a substring is in the text
      number_of_appearances = count_substring(text, word)
      puts number_of_appearances
      next count_dictionary if number_of_appearances == 0

      count_dictionary[word] = number_of_appearances
      count_dictionary
  end    
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)