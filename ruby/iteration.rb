# def some_method
#   puts "This is before the block."
#   array = [1, 2, 3, 4, 5]
#   yield(array)
# end

# some_method { |array| puts "Number #{array} is in the block." }


# #Release 0 Practice

# # def some_method
# #   puts "This is before the block."
# #   array = [1, 2, 3, 4, 5]
# #   yield(array)
# # end
# # some_method { |array| puts "Number #{array} is in the block." }

# #Release 1
# array = [1, 2, 3, 4, 5]
# p "Before each, array is #{array}."
# array.each { |x| x*10}
# p "After each, array is #{array}."
# array.map! { |x| x*10}
# p "After map!, array is #{array}."

# puts 

# hash = {
#   "Brian" => "Lin",
#   "Devin" => "Miller",
#   "David" => "Qiu",
#   "Donald" => "Yang"
# }

# print "Before each, hash is #{hash}."
# puts
# hash.each {|first, last| p "Here is #{first} #{last}."}
# print "After each, hash is #{hash}."

num_array = [1,2,3,4,5,6,7,8,9,10]

print num_array

num_array.delete_if { |num| num < 5 }

print num_array

num_array = [1,2,3,4,5,6,7,8,9,10]

print num_array.select { |num| num.even? }

print num_array

num_array = [1,2,3,4,5,6,7,8,9,10]

num_array.keep_if { |num| num < 5 }

print num_array

num_array = [1,2,3,4,5,6,7,8,9,10]

print num_array.drop_while { |num| num < 7 }

print num_array