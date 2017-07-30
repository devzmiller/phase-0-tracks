array = [ 16, 57, 63, 12, 78, 27]  

def search_array(array, num)   
  num_exists = false   

  index = 0   

  array.each do |x|     

    if x == num       
      num_exists = true     
      return index     
    end     

    index += 1   
  end   

  if num_exists == false     
    nil   
  end 
end  

p search_array(array, 63)

def fib(num_of_numbers)

  fib_array = [0, 1]

  num1 = 0
  num2 = 1

  while fib_array.length < num_of_numbers

    num3 = num1 + num2

    fib_array.push(num3)

    num1 = num2

    num2 = num3

  end

  return fib_array

end

print fib(6)

if fib(100).last == 218922995834555169026
  puts "Your fibonacci method works!"
else
  puts "Your fibonacci method does not work. :("
end