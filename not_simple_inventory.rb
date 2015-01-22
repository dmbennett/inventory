#Ruby Inventory:
#The user can add or remove items
#The user can set the current number of items
#The user can print out a table structure
#The user can zero out an item

#The user cannot put in nonsensical data: -1 bananas
#When you start the program it gives a list of all the options

#Create a github repository for this and push your code and it’s updates to it.
puts 'Welcome to Kellyn and Dave\'s inventory program'
puts 

#The user can add or remove items
inventory = {"apple" => 1, "banana" => 10, "orange" => 20}
puts "Our current inventory has: #{inventory}"
 

#adding items
  puts "What item would like to add?"
  item_to_add = gets.chomp.downcase
  puts "How many would you like to add?"
  quantity_of_item_to_add = gets.chomp.to_i

  inventory[item_to_add] = quantity_of_item_to_add

puts inventory

#remove
    puts "What item would you like to remove?"
    item_to_remove = gets.chomp.downcase
    inventory.delete(item_to_remove)
    puts inventory

#update
puts "What inventory item would you like to update?"
puts inventory
item_to_update = gets.chomp.downcase
puts "What is the new quantity of #{item_to_update}?"
quantity_to_update = gets.chomp.to_i
inventory[item_to_update] = quantity_to_update
puts inventory


#table
inventory.each do |item, quantity|
    puts item + ' : ' + quantity.to_s
end




