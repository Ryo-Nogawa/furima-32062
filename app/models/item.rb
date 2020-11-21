class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :title,             length: { maximum: 40 }
    validates :detail,            length: { maximum: 1000 }
    validates :delivery_area_id,  numericality: { other_than: 0 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_condition_id
      validates :item_cost_id
      validates :delivery_date_id
    end
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :item_cost
  belongs_to :delivery_area
  belongs_to :delivery_date
end
