class OrderAddress
  include ActiveModel::Model 

  #保存したいカラム名
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :prefectual_id, :city, :house_number, :building_name, :phone_number, :token

  #バリデーション 
  with_options presence: true do
    validates :token
    validates :postal_code,   format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefectual_id, numericality: { other_than: 0 }
    validates :city,          format: {with: /\A[一-龥ぁ-ん]/}
    validates :house_number  
    validates :phone_number,  format: {with: /\A\d{10,11}\z/}
  end

  #送られて来た情報を各テーブルの保存する処理
  def save
    #Orderテーブルに保存する情報
    order = Order.create(user_id: user_id, item_id: item_id )
    #Addressテーブルに保存する情報
    Address.create(order_id: order.id, postal_code: postal_code, prefectual_id: prefectual_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end

end 