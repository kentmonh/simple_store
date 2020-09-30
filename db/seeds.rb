Product.delete_all

676.times do
  Product.create(
    title:          Faker::Commerce.unique.product_name,
    price:          Faker::Commerce.price,
    stock_quantity: Faker::Number.non_zero_digit
  )
end

puts "Created #{Product.count} Products"
