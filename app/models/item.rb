class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :title,             length: {maximum: 40}
    validates :detail,            length: {maximum: 1000}
    validates :category_id,       numericality: { other_than: 1}
    validates :item_condition_id, numericality: { other_than: 1}
    validates :item_cost_id,      numericality: { other_than: 1}
    validates :delivery_area_id,  numericality: { other_than: 1} 
    validates :delivery_date_id,  numericality: { other_than: 1}
    validates :price,            numericality: { only_integer: true, greater_than: 300, less_than: 9999999}, format: {with: /\A[0-9]+\z/ }
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecodeExtensions
  belongs_to :category
  belongs_to :item_condition 
  belongs_to :item_cost
  belongs_to :delivery_area
  belongs_to :delivery_date
end
