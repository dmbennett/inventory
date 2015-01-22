inventory = {"apple" => 1, "banana" => 10, "orange" => 20, "concord grapes" => 10}

inventory.each do |item, quantity|
  puts item + " : #{quantity}"
end