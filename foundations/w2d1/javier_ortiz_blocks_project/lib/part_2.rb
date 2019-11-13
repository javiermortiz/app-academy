def all_words_capitalized?(arr)
    arr.all? { |el| el == el.capitalize}
end


def no_valid_url?(arr)
    domains = ['.com', '.net', '.io', '.org']
    arr.none? {|url| domains.include?(url[-4..-1]) || domains.include?(url[-3..-1])}
end


def any_passing_students?(arr)
    arr.any? do |student| 
        average = student[:grades].sum  / (student[:grades].length * 1.0)
        average >= 75
    end
end