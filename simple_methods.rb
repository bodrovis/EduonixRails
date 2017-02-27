def first_method#()
  puts 'hi'
end

first_method#()

def calc(a, b, c = 5) # calc a, b
  return 0 if c < 5
  a + b + c
end

result = calc(1,2,3)
puts result