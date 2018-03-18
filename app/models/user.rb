class User < ApplicationRecord
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }, format: { with: /\A[a-zA-Z0-9]+\Z/, message: 'only letters and numbers allowed' }
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :destroy
end