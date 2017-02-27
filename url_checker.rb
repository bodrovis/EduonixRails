puts 'Please enter something:'
input = gets.strip
pattern = /\Ahttps?:\/\/[\w\d-]+\.\w{1,8}\z/i

if input.length == 0
  puts "You have not entered anything!"
elsif input =~ pattern
  puts 'This is a URL!'
else
  puts 'This is not a URL...'
end