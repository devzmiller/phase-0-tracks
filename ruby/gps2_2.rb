## Code for GPS 2.2: Grocery List Exercise
#  Coded by Miguel A. Ibarra, Jr. with Devin Miller as Navigator

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Take in a string of items separated by spaces
  # Create an array of items from the string, each word is an element in the array
  # Elements will be keys for our grocery list hash
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: grocery list hash
def create_grocery_list(str)
  items = str.split(" ")
  grocery_list = Hash.new
  # Alternative way to store items in a list
  # counter = 0
  # while counter < items.length
  #   grocery_list.store(items[counter], 1)
  #   counter += 1
  # end
  items.each do |item|
    grocery_list.store(item, 1)
  end
  list_formatter(grocery_list)
end


# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
  # Add item and quantity into existing list
# output: Updated hash of grocery list
def list_adder(list, item_name, quantity=1) # quantity=1 makes 1 the default and the argument optional
  list.store(item_name, quantity)
end


# Method to remove an item from the list
# input: list name and item name
# steps:
  # Search for item in list hash
  # Remove item from the list
# output: Updated list
def remove_item(list, item_name)
  list.delete(item_name)
end


# Method to update the quantity of an item
# input: list, the item we wish to update, and quantity (integer)
# steps:
  # look for for the item in the list
  # update the quantity for that item
# output: updated list
def update_quanity(list, item_name, new_quantity)
  list[item_name] = new_quantity
end

# Method to print a list and make it look pretty
# input: list
# steps:
  # Iterate through the list
  # Format and print each item
# output: Formatted output of the items in the list
def list_formatter(list)
  list.each do |item, quantity|
    puts "we need #{quantity} of #{item}"
  end
end

## Driver Code

grocery_items = "apple orange ham salad"
test_list = create_grocery_list(grocery_items)

list_adder(test_list, "cheese")
list_adder(test_list, "milk", 3)

remove_item(test_list, "ham")

update_quanity(test_list, "cheese", 5)

list_formatter(test_list)


### Reflection

# When pseudocoding previously I've made sure to list
# the steps to accomplish the goal, but haven't 
# made sure to specify what the input and output is. 
# Doing that seemed helpful.

# We used a hash for this challenge, which seemed very
# straightforward. We could just set the item names to the
# hash keys and the quantities to the hash values. This
# seems intuitive, and there were convenient hash methods
# to do everything we needed to. I'm not sure how you 
# would use an array for this unless you had the item as
# one array value and the quantity as the next, or the items
# and quantities in two separate arrays with the pairs
# in the same positions. This seems like a less intuitive
# way to do this.

# A method returns the last evaluated value. If the last statement
# in the method is a print statement, the method will return nil.
# Printing is just a temporary thing that happens; it's not a value
# that gets returned.

# A method can have any kind of parameters, but the arguments you pass
# to it have to match the number and data type of the parameters. You can,
# however, pass the another method as a method argument, if the return
# value of the method you're passing matches the parameter.

# Information can only be passed between methods as method arguments.
# So if you use one method to create a grocery list, you can only tell
# other methods to modify the grocery list by passing the list name
# as an argument.

# This challenge helped me be clearer on different ways to iterate 
# through a data structure and on the differences between methods and classes.
# I also got more practice with hash methods. I'm still developing my 
# understanding of all of those things and at this point think I just need 
# more practice.