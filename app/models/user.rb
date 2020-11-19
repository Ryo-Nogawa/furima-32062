class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,        format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i}
  with_options presence: true do
    validates :nickname
    validates :last_name,       format: {with: /\A[一-龥ぁ-ん]/}
    validates :first_name,      format: {with: /\A[一-龥ぁ-ん]/}
    validates :kana_last_name,  format: {with: /\A[ァ-ヶー－]+\z/}
    validates :kana_first_name, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
end


