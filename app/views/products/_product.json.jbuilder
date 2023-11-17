json.extract! product, :id, :name, :price, :delivery_cost, :delivery_time, :vendor, :description, :quantity, :size, :sub_category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
