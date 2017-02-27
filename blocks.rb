def convert_and_calculate(a, b)
  a = a.to_i
  b = b.to_i
  block_given? ? yield(a, b) : nil
end

puts convert_and_calculate('1', '2') { |a, b| a + b }