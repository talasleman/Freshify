json.extract! product, :id, :name, :description, :price, :category, :image_url, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
