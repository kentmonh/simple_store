require "csv"

# Clearing our the products and categories tables
Product.destroy_all
Category.destroy_all

# Loop through the rows of a CSV file
csv_file = Rails.root.join("db/products.csv")

csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

products.each do |product|
  categoty = Category.find_or_create_by(name: product["category"])

  next unless categoty&.valid?

  p = categoty.products.create(
    title:          product["name"],
    description:    product["description"],
    price:          product["price"],
    stock_quantity: product["stock quantity"]
  )
end

puts "Created #{Category.count} categories"
puts "Created #{Product.count} products"
