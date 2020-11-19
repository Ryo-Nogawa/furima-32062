class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  validates :password,        format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i}
  validates :nickname,        presence: true
  validates :last_name,       presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :first_name,      presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :kana_last_name,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :kana_first_name, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday,        presence: true
end


