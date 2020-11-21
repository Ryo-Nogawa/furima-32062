class Address < ApplicationRecord

  belongs_to :orderss

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
