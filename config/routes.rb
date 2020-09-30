Rails.application.routes.draw do
  # Load and display all products
  get "/products", to: "products#index", as: "products"

  # Load and display a single product
  get "/products/:id", to: "products#show", as: "product", constraints: { id: /\d+/ }
end
