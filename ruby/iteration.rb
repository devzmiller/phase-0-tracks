### Release 0 ###

def some_method
  puts "This is before the block."
  array = [1, 2, 3, 4, 5]
  yield(array)
end

some_method { |array| puts "Numbers #{array} are in the block." }


### Release 1 ###

array = [1, 2, 3, 4, 5]
p "Before each, array is #{array}."
array.each { |x| x*10}
p "After each, array is #{array}."
array.map! { |x| x*10}
p "After map!, array is #{array}."

hash = {
  "Brian" => "Lin",
  "Devin" => "Miller",
  "David" => "Qiu",
  "Donald" => "Yang"
}

print "Before each, hash is #{hash}."
hash.each {|first, last| p "Here is #{first} #{last}."}
print "After each, hash is #{hash}."

### Release 2 ###

## Arrays

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

## Hashes

hash = {
  "Brian" => "Lin",
  "Devin" => "Miller",
  "David" => "Qiu",
  "Donald" => "Yang"
}

puts "Hash before delete_if: #{hash}"

hash.delete_if {|key, value| key == "Brian"}

puts "Hash after delete_if: #{hash}"

hash = {
  "Brian" => "Lin",
  "Devin" => "Miller",
  "David" => "Qiu",
  "Donald" => "Yang"
}

puts "Hash before .select: #{hash}"

puts "Hash during .select: #{hash.select {|key, value| key[0] == "D"}}"

puts "Hash after .select: #{hash}"

hash = {
  "Brian" => "Lin",
  "Devin" => "Miller",
  "David" => "Qiu",
  "Donald" => "Yang"
}

puts "Hash before .keep_if: #{hash}"

hash.keep_if { |key, value| value.length < 4}

puts "Hash after .keep_if: #{hash}"

hash = {
  "Brian" => "Lin",
  "Devin" => "Miller",
  "David" => "Qiu",
  "Donald" => "Yang"
}

puts "Hash before .reject!: #{hash}"

hash.reject! { |key, value| value.length < 4}

puts "Hash after .reject!: #{hash}"