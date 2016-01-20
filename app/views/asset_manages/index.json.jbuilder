json.array!(@asset_manages) do |asset_manage|
  json.extract! asset_manage, :id, :brand, :category, :model, :owner_id, :producer, :product, :price, :qty, :stock_in_number, :stock_out_number, :unit, :remarks, :seq
  json.url asset_manage_url(asset_manage, format: :json)
end
