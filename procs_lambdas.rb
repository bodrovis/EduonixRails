def my_method(name, &block)
  block.call(name)
end
my_proc = Proc.new {|string| puts string}
my_method('test', &my_proc)

