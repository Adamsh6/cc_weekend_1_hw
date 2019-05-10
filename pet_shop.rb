require( 'pry' )

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_sold)
  pet_shop[:admin][:pets_sold] += number_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].size
end

def pets_by_breed(pet_shop, breed)
  total_pets = []
  for pet in pet_shop[:pets]
    #binding.pry
    total_pets << pet if pet[:breed] == breed
  end
  return total_pets
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    return pet if pet[:name] == name
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  pet = find_pet_by_name(pet_shop, name)
  pet_shop[:pets].delete(pet)
end


def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, payment)
  customer[:cash] -= payment
end

def customer_pet_count(customer)
  return customer[:pets].size
end

def add_pet_to_customer(customer, pet)
  customer[:pets] << pet
end

def customer_can_afford_pet(customer, pet)
  return true if customer[:cash] >= pet[:price]
  return false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  return if pet == nil
  return if customer_can_afford_pet(customer, pet) == false
  pet_cost = pet[:price]
  remove_customer_cash(customer, pet_cost)
  add_or_remove_cash(pet_shop, pet_cost)
  remove_pet_by_name(pet_shop, pet[:name])
  add_pet_to_customer(customer, pet)
  increase_pets_sold(pet_shop, 1)
  # binding.pry
end
