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