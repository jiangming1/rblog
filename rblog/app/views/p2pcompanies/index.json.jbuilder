json.array!(@p2pcompanies) do |p2pcompany|
  json.extract! p2pcompany, :id, :c_name, :c_icon, :c_net_address, :c_phone, :c_address, :c_create_time, :c_persion, :c_province, :c_product_type
  json.url p2pcompany_url(p2pcompany, format: :json)
end
