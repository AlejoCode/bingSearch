require 'rest-client'
matcher = /<h2><a.*?href="(?<link>.*?)".*?h=.*?>(?<text>.*?)<\/a.*?>/

puts "what would you like to search for?"
input = gets.chomp

response = RestClient.get "https://www.bing.com/search?q=#{input}"
results = []
response.scan(matcher) {results << $~}
p results
i = 1
puts "-------------------------"
puts "The results are:"
results.each do |result|
  puts "#{i}. #{result[:text]}"
  puts " -- Link:#{result[:link]}"
  i += 1
end
puts "-------------------------"