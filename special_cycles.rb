5.upto(10) do |value|
  #puts value * 2
end

3.times do |i|
  #puts "hi #{i}"
end

(10..15).each do |value|
  #puts value
end

loop do
  puts 'working...'
  break if rand(40) > 20
end