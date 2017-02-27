#my_hash = { 'some_string' => 10, 34.5 => [1,2], :another_key => 'value' }
my_hash = { 'some_string' => 10, 34.5 => [1,2], another_key: 'value' }
#puts my_hash[34.5][0]
#puts my_hash[:another_key]

puts my_hash[:non_existent].inspect