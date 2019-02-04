class WordConverter
MIN_WORD_SIZE = 2
MAX_NUM_SIZE = 10

  def convert(digits)
    # time_start = Time.now()
    letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}
    final_words = []
    dictionary = []
    
    file_path = "/Users/mybataz/Downloads/dictionary.txt"
    File.foreach( file_path ) do |word|
      dictionary << word.chop.to_s.downcase
    end

    unless (digits.length == 10 && digits.match(/^[2-9]*$/))
      raise "Invalid Number"
    end

    keys = digits.chars.map{|digit|letters[digit]}

    all_keys = keys[0..(keys.length-1)]
    all_words = all_keys.shift.product(*all_keys).map(&:join)
    count = MAX_NUM_SIZE - MIN_WORD_SIZE

    i = 1
    while i < count do
      first_word = all_words.map{|x| x[0..i]}.uniq
      second_word = all_words.map{|x| x[i+1..-1]}.uniq
      results = (dictionary & first_word).product(dictionary & second_word)
      final_words << results unless results.empty?
      i += 1
    end
    combo_words = dictionary & all_words
    final_words << combo_words
    p final_words.flatten(1)
    # time_end = Time.now()
    # puts "Time #{time_end.to_f - time_start.to_f}"
  end
end

WordConverter.new.convert("2282668687")