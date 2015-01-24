#Ruby Inventory:
#The user can add or remove items
#The user can set the current number of items
#The user can print out a table structure
#The user can zero out an item
#The user cannot put in nonsensical data: -1 bananas
#When you start the program it gives a list of all the options
##################################################################################################################
def print_in_table(inventory)
  # the following figures out the maximum length of the item string
  item_spacing = 0
  inventory.each do |item, quantity|
    item_spacing = item.length
    if item_spacing < item.length
      item_spacing = item.length
    end
  end

  #the following prints it using the spacing calculated above
  puts "ITEM:".ljust(item_spacing+1) + "| QUANTITY:"
  inventory = inventory.sort_by { |item, quantity| item}
  inventory.each do |item, quantity|
    puts item.split.map(&:capitalize).join(' ').ljust(item_spacing+1) + "| #{quantity}"
  end
end

def update_item_and_quantity (inventory, item, quantity)
  valid_entry = false
  while valid_entry == false
    if quantity == 0
      inventory.delete(item)
      valid_entry = true
    elsif quantity < 0
      puts "You put an invalid entry: #{quantity}. Please put a positive number."
      puts "Please enter the total quantity: "
      quantity = gets.chomp.to_i
      valid_entry = false
    else
      inventory[item] = quantity
      valid_entry = true
    end
  end
end

def contains_number? (string)
  (string =~ /\d/) ? true : false
end

##################################################################################################################
exit = false
#begin the actual program loop, exit when exit = true
inventory = {"apple" => 1, "banana" => 10, "orange" => 20, "concord grapes" => 10}
until exit do

  puts %q{Welcome to Kellyn and Dave's Emporium
  Please select an item from the following menu
  1. Print  - to print a table of our items and what we have in stock
  2. Update - to add a new item or update the quantity of an item already in stock
  3. Remove - to remove an item
  4. Exit   - will exit the program
What is your selection? Type: print, update, or remove: }
  menu_selection = gets.chomp.downcase

  if menu_selection == "print" || menu_selection == "1. print" || menu_selection =="1" || menu_selection =="1."
    #table-ish
    print_in_table(inventory)

  elsif menu_selection == "update" || menu_selection =="2. add" || menu_selection =="2" || menu_selection =="2."
    #adding or updating items
    puts "What item would like to update or add?"
    item = gets.chomp.downcase
    while contains_number?(item)
      puts 'Your item name cannot have a number in it. Please re-enter the item name'
      item = gets.chomp.downcase
    end

    puts "Please enter the total quantity: "
    quantity = Integer(gets.chomp) rescue nil
    until quantity.is_a?(Fixnum) do
      puts 'You must enter a whole number: '
      quantity = Integer(gets) rescue nil
    end

    update_item_and_quantity(inventory, item, quantity)
    print_in_table(inventory)

  elsif menu_selection == "remove" || menu_selection =="3. remove" || menu_selection =="3" || menu_selection =="3."
    #remove
    print_in_table(inventory)
    puts "What item would you like to remove?"
    item_to_remove = gets.chomp.downcase
    inventory.delete(item_to_remove)
    print_in_table(inventory)
  elsif menu_selection == "exit" || menu_selection =="4. exit" || menu_selection =="4" || menu_selection =="4."
    break

  else
    #did they have a typo? then ask them to check again
    puts "Please check your selection, you typed: #{menu_selection}?"
    puts "\"#{menu_selection.capitalize}\" is not a valid entry"
  end

  puts "Would you like to continue updating the inventory? [y/n]: "
  exit = gets.chomp.downcase

  #the condition for ending our while that ends our program
  if exit == "y" || exit=="yes"
    exit = false
  elsif exit == "n" || exit=="no"
    exit = true
  else
    puts "You may have made a typo, returning you to the main menu."
    exit = false
  end
end