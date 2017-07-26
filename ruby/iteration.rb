def some_method
  puts "This is before the block."
  array = [1, 2, 3, 4, 5]
  yield(array)
end

some_method { |array| puts "Number #{array} is in the block." }