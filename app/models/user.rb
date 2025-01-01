class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :photographs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_picture
  validates :profile_picture, presence: true

  attribute :is_karina, :boolean, default: false
end

