# return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
def substrings(word, dictionary)
  #1. Handle common contractions
  word_split = word.downcase
                 .gsub(/won't\b/, 'will not')      # Special case: won't
                 .gsub(/can't\b/, 'can not')       # Special case: can't
                 .gsub(/n't\b/, ' not')            # Generic n't -> not (doesn't, isn't, haven't, etc.)
                 .gsub(/'ll\b/, ' will')           # Generic 'll -> will (I'll, we'll, etc.)
                 .gsub(/'re\b/, ' are')            # Generic 're -> are (they're, we're, etc.)
                 .gsub(/'ve\b/, ' have')           # Generic 've -> have (I've, they've, etc.)
                 .gsub(/'m\b/, ' am')              # I'm -> I am
                 .gsub(/let's\b/, 'let us')        # let's -> let us
                 .gsub(/'s\b/, ' is')              # Generic 's -> is (he's, she's, etc.)
                 .gsub(/'d\b/, ' would')           # Generic 'd -> would (he'd, they'd, etc.)
                 .split(/\W+/)                     # Split on non-word chars

  #2. iterate through the dictionary
  substring_counts=dictionary.reduce(Hash.new(0)) do |accumulator, word|
    accumulator[word] += 1
    accumulator
  end
  p substring_counts
end

# Run Test
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)