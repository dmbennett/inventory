#Ruby Inventory:
#The user can add or remove items
#The user can set the current number of items
#The user can print out a table structure
#The user can zero out an item

#The user cannot put in nonsensical data: -1 bananas
#When you start the program it gives a list of all the options

#Create a github repository for this and push your code and it’s updates to it.

exit = false
inventory = {"apple" => 1, "banana" => 10, "orange" => 20, "concord grapes" => 10}

while exit == false do

  puts "Welcome to Kellyn and Dave's Fruit Emporium"
  puts "Please select an item from the following menu"
  puts "1. Print - to print a table of our items and what we have in stock"
  puts "2. Add - to add an item to our inventory"
  puts "3. Update - to update the quantity of an item already in stock"
  puts "4. Remove - to zero out an item"
  puts "5. Exit - will exit the program"
  puts "What is your selection? Type: print, add, update, or remove"
  menu_selection = gets.chomp.downcase



  # The while loop is a wrapper for the program to continue looping until the user writes exit.

    if menu_selection == "add" || menu_selection =="2. add" || menu_selection =="2" || menu_selection =="2."
      #adding items
        puts "What item would like to add?"
        item_to_add = gets.chomp.downcase
        puts "How many would you like to add?"
        quantity_of_item_to_add = gets.chomp.to_i

        inventory[item_to_add] = quantity_of_item_to_add

      puts inventory

    elsif menu_selection == "remove" || menu_selection =="4. remove" || menu_selection =="4" || menu_selection =="4."
      #remove
          puts inventory
          puts "What item would you like to remove?"
          item_to_remove = gets.chomp.downcase
          inventory.delete(item_to_remove)
          puts inventory

    elsif menu_selection == "update" || menu_selection =="3. update" || menu_selection =="3" || menu_selection == "3."
      #update
      puts inventory
      puts "Please type the name of the item you would like to update?"
        item_to_update = gets.chomp.downcase
      puts "What is the new quantity of #{item_to_update}?"
        quantity_to_update = gets.chomp.to_i

      inventory[item_to_update] = quantity_to_update
      puts inventory

    elsif menu_selection == "print" || menu_selection == "1. print" || menu_selection =="1" || menu_selection =="1."
      #table
      inventory.each do |item, quantity|
          puts item + " : #{quantity}"
      end

    elsif exit == "y" || exit=="yes"
      exit = true
    else
      puts "Please check your selection, did you mean: #{menu_selection}?"
    end
  puts "Would you like to exit? [y/n]: "
  exit = gets.chomp.downcase
    if exit == "y" || exit=="yes"
      exit = true
    elsif exit == "n" || exit=="no"
      exit = false
    else
      puts "You may have made a typo, returning you to the main menu."
    end
end
