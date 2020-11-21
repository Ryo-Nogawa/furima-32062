class OrderAddress
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code,   format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city,          format: {with: /\A[一-龥ぁ-ん]/}
    validates :house_number,  
    validates :phone_number,  format: {with: /\A\d{10,11}\z/}
  end

  def save
    order = Order.create(user_id: user.id, item_id: item.id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: delivery_area, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end 