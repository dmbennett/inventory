inventory = {"apple" => 1, "banana" => 10, "orange" => 20, "concord grapes" => 10}

print inventory.sort_by{|item, quantity| item}