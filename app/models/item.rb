class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :title,             length: {maximum: 40}
    validates :detail,            length: {maximum: 1000}
    validates :category_id
    validates :item_condition_id
    validates :item_cost_id
    validates :delivery_area_id 
    validates :delivery_date_id
    validates :price,            numericality: {only_integer: true, greater_than: 300, less_than: 9999999}, format: {with: /\A[0-9]+\z/ }
  end

  belongs_to :user
  has_one_attached :image
end
