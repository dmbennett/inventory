inventory = {"car" => 1, "boat" => 2, "plane" => 3, "car1" => 10, "car2" => 20, "car3" => 1, "boat1" => 10}

def print_in_table(inventory)
  #the following figures out the maximum length of the item string
  item_spacing = 0
  quantity_spacing = 0

  inventory.each do |item, quantity|
    item_spacing = item.length
    quantity_spacing = quantity.size
    if item_spacing < item.length
      item_spacing = item.length
    end
  end

  #the following prints it using the spacing calculated above
  puts "ITEM".ljust(item_spacing+1) + ": QUANTITY"
  inventory.each do |item, quantity|
    puts item.ljust(item_spacing+1) + ": #{quantity}"
  end
end

print_in_table(inventory)